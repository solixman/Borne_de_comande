import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1:8000/api';
  static const String authToken = 'your_auth_token_here'; // Replace with actual token
  
  static Map<String, String> get headers => {
    'Authorization': 'Bearer $authToken',
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  static Future<List<Category>> getCategories() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/categories'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> categoriesJson = json.decode(response.body);
        return categoriesJson.map((json) => Category.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load categories: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching categories: $e');
      return [];
    }
  }

  static Future<List<MenuItem>> getProductsByCategory(int categoryId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/produits/categorie/$categoryId'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> produitsJson = data['produits'] ?? [];
        
        return produitsJson.map((json) => MenuItem.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  static Future<int?> createTicket() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/document'),
        headers: headers,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        return data['ticket_id'];
      } else {
        throw Exception('Failed to create ticket: ${response.statusCode}');
      }
    } catch (e) {
      print('Error creating ticket: $e');
      return null;
    }
  }

  static Future<bool> addProductToTicket(int ticketId, int productId, int quantity) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/document/$ticketId/lines'),
        headers: headers,
        body: json.encode({
          'produit_id': productId,
          'quantity': quantity,
        }),
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      print('Error adding product to ticket: $e');
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
    return Category(
      id: json['id_categorie'],
      name: json['nom'],
      description: json['description'] ?? '',
      imageUrl: json['image'] ?? _getDefaultImageForCategory(json['id_categorie']),
      visible: json['visible'] == 1,
    );
  }

  static String _getDefaultImageForCategory(int categoryId) {
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
    return MenuItem(
      id: json['idProduit'] ?? json['id'],
      name: json['nom'] ?? json['name'],
      description: json['description'] ?? 'Délicieux produit',
      price: (json['prix'] ?? json['price'] ?? 0).toDouble(),
      imageUrl: json['image'] ?? _getImageForProduct(json['idProduit'] ?? json['id'] ?? 1),
    );
  }

  static String _getImageForProduct(int productId) {
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
