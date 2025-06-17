import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

// Response classes for structured API responses
class CategoriesResponse {
  final List<dynamic> categories;

  CategoriesResponse({required this.categories});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(categories: json['categories']);
  }
}

class ProductsResponse {
  final List<dynamic> produits;

  ProductsResponse({required this.produits});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(produits: json['produits']);
  }
}

class ApiService {
  // Better URL handling for different platforms
  static final String baseUrl = () {
    if (kIsWeb) {
      return 'http://localhost:8000/api';
    } else if (Platform.isAndroid) {
      return 'http://10.0.2.2:8000/api';
    } else {
      return 'http://127.0.0.1:8000/api';
    }
  }();

  // You can set this token if needed, or remove auth if not required
  static const String authToken = 'your_auth_token_here'; // Replace with actual token or remove
  
  static Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    if (authToken.isNotEmpty && authToken != 'your_auth_token_here')
      'Authorization': 'Bearer $authToken',
  };

  static Future<List<Category>> getCategories() async {
    try {
      print('Fetching categories from: $baseUrl/categories');
      final response = await http.get(
        Uri.parse('$baseUrl/categories'),
        headers: headers,
      );

      print('Categories response status: ${response.statusCode}');
      print('Categories response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Handle both direct list and wrapped response
        List<dynamic> categoriesJson;
        if (responseData is List) {
          categoriesJson = responseData;
        } else {
          final categoriesResponse = CategoriesResponse.fromJson(responseData);
          categoriesJson = categoriesResponse.categories;
        }

        print('Found ${categoriesJson.length} categories');
        return categoriesJson.map((json) => Category.fromJson(json)).toList();
      } else {
        final responseData = jsonDecode(response.body);
        throw Exception(responseData['message'] ?? 'Failed to fetch categories');
      }
    } catch (e) {
      print('Error fetching categories: $e');
      return [];
    }
  }

  static Future<List<MenuItem>> getProductsByCategory(int categoryId) async {
    try {
      final url = '$baseUrl/produits/categorie/$categoryId';
      print('Fetching products from: $url');
      
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      print('Products response status: ${response.statusCode}');
      print('Products response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Handle both direct list and wrapped response
        List<dynamic> produitsJson;
        if (responseData is List) {
          produitsJson = responseData;
        } else {
          final productsResponse = ProductsResponse.fromJson(responseData);
          produitsJson = productsResponse.produits;
        }
        
        print('Found ${produitsJson.length} products for category $categoryId');
        return produitsJson.map((json) => MenuItem.fromJson(json)).toList();
      } else {
        final responseData = jsonDecode(response.body);
        throw Exception(responseData['message'] ?? 'Failed to fetch products');
      }
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  static Future<int?> createTicket() async {
    try {
      print('Creating new ticket at: $baseUrl/document');
      final response = await http.post(
        Uri.parse('$baseUrl/document'),
        headers: headers,
      );

      print('Create ticket response status: ${response.statusCode}');
      print('Create ticket response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        final ticketId = responseData['ticket_id'] ?? responseData['id'];
        print('Created ticket with ID: $ticketId');
        return ticketId;
      } else {
        final responseData = jsonDecode(response.body);
        throw Exception(responseData['message'] ?? 'Failed to create ticket');
      }
    } catch (e) {
      print('Error creating ticket: $e');
      return null;
    }
  }

  static Future<bool> addProductToTicket(int ticketId, int productId, int quantity) async {
    try {
      final url = '$baseUrl/document/$ticketId/lines';
      print('Adding product to ticket at: $url');
      print('Product ID: $productId, Quantity: $quantity');
      
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode({
          'produit_id': productId,
          'quantity': quantity,
        }),
      );

      print('Add product response status: ${response.statusCode}');
      print('Add product response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        print('✅ ${responseData['message'] ?? 'Product added successfully'}');
        return true;
      } else {
        final responseData = jsonDecode(response.body);
        print('❌ Server error: ${responseData['message']}');
        return false;
      }
    } catch (e) {
      print('❌ Connection error: $e');
      return false;
    }
  }
}

class Category {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final bool visible;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.visible,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    print('Parsing category JSON: $json');
    return Category(
      id: json['id_categorie'] ?? json['id'] ?? 0,
      name: json['nom'] ?? json['name'] ?? 'Unknown Category',
      description: json['description'] ?? '',
      imageUrl: json['image'] ?? json['image_url'] ?? _getDefaultImageForCategory(json['id_categorie'] ?? json['id'] ?? 0),
      visible: (json['visible'] ?? json['is_visible'] ?? 1) == 1,
    );
  }

  static String _getDefaultImageForCategory(int categoryId) {
    // Fallback images if API doesn't provide image URLs
    switch (categoryId) {
      case 1:
        return 'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=1000';
      case 2:
        return 'https://images.unsplash.com/photo-1550507992-eb63ffee0847?q=80&w=1000';
      case 3:
        return 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000';
      case 4:
        return 'https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?q=80&w=1000';
      default:
        return 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000';
    }
  }
}

class MenuItem {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    print('Parsing product JSON: $json');
    return MenuItem(
      id: json['id_produit'] ?? json['idProduit'] ?? json['id'] ?? 0,
      name: json['nom'] ?? json['name'] ?? 'Unknown Product',
      description: json['description'] ?? 'Délicieux produit',
      price: double.tryParse(json['prix']?.toString() ?? json['price']?.toString() ?? '0') ?? 0.0,
      imageUrl: json['image'] ?? json['image_url'] ?? _getImageForProduct(json['id_produit'] ?? json['idProduit'] ?? json['id'] ?? 1),
    );
  }

  static String _getImageForProduct(int productId) {
    // Fallback images if API doesn't provide image URLs
    final List<String> images = [
      'https://images.unsplash.com/photo-1612392062631-94dd858cba88?q=80&w=1000',
      'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1000',
      'https://images.unsplash.com/photo-1553979459-d2229ba7433b?q=80&w=1000',
      'https://images.unsplash.com/photo-1607013251379-e6eecfffe234?q=80&w=1000',
      'https://images.unsplash.com/photo-1599974579688-8dbdd335c77f?q=80&w=1000',
      'https://images.unsplash.com/photo-1613514785940-daed07799d9b?q=80&w=1000',
      'https://images.unsplash.com/photo-1551504734-5ee1c4a3479c?q=80&w=1000',
      'https://images.unsplash.com/photo-1604068549290-dea0e4a305ca?q=80&w=1000',
      'https://images.unsplash.com/photo-1628840042765-356cda07504e?q=80&w=1000',
      'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=1000',
      'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=1000',
    ];
    
    return images[productId % images.length];
  }
}

class CartManager {
  static final List<CartItem> _cartItems = [];
  static List<CartItem> get cartItems => _cartItems;

  static void addToCart(MenuItem item) {
    final existingIndex = _cartItems.indexWhere(
      (cartItem) => cartItem.item.id == item.id,
    );
    if (existingIndex >= 0) {
      _cartItems[existingIndex].quantity++;
    } else {
      _cartItems.add(CartItem(item: item, quantity: 1));
    }
  }

  static void removeFromCart(int itemId) {
    _cartItems.removeWhere((cartItem) => cartItem.item.id == itemId);
  }

  static void updateQuantity(int itemId, int quantity) {
    final index = _cartItems.indexWhere(
      (cartItem) => cartItem.item.id == itemId,
    );
    if (index >= 0) {
      if (quantity <= 0) {
        _cartItems.removeAt(index);
      } else {
        _cartItems[index].quantity = quantity;
      }
    }
  }

  static double get totalPrice {
    return _cartItems.fold(
      0,
      (total, cartItem) => total + (cartItem.item.price * cartItem.quantity),
    );
  }

  static void clearCart() {
    _cartItems.clear();
  }
}

class CartItem {
  final MenuItem item;
  int quantity;

  CartItem({required this.item, required this.quantity});
}
