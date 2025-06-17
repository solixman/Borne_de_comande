import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'services/api_service.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOLIX Borne de Démonstration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFF6B35),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6B35),
          primary: const Color(0xFFFF6B35),
          secondary: const Color(0xFF00BCD4),
          brightness: Brightness.light,
        ),
        fontFamily: 'Roboto',
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 600;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DiningOptionScreen()),
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
            child: Column(
              children: [
                // Top section with restaurant background
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Touch icon
                        Container(
                          width: isSmallScreen ? 80 : 120,
                          height: isSmallScreen ? 80 : 120,
                          decoration: BoxDecoration(
                            color: const Color(0xFF00BCD4),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF00BCD4).withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.touch_app,
                            color: Colors.white,
                            size: isSmallScreen ? 40 : 60,
                          ),
                        ),
                        SizedBox(height: isSmallScreen ? 20 : 40),

                        // Title
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: isSmallScreen ? 16 : 0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: isSmallScreen ? 30 : 60,
                                height: 2,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                'BORNE DE COMMANDES',
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 18 : 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Container(
                                width: isSmallScreen ? 30 : 60,
                                height: 2,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Borne de démonstration',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom section
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      Container(
                        width: isSmallScreen ? 60 : 80,
                        height: isSmallScreen ? 60 : 80,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            'ℝ',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 30 : 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 20 : 30),

                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isSmallScreen ? 16 : 0,
                        ),
                        child: const Text(
                          'APPUYER SUR L\'ÉCRAN POUR COMMANDER',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(221, 243, 238, 238),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Language selector
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: Image.network(
                                'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/1200px-Flag_of_France.svg.png',
                                width: 20,
                                height: 14,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Français',
                              style: TextStyle(
                                color: Color.fromARGB(221, 243, 241, 241),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DiningOptionScreen extends StatelessWidget {
  const DiningOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 600;
    final bool isVerySmallScreen = screenSize.width < 400;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 35, 34, 33).withOpacity(0.3),
                const Color.fromARGB(255, 20, 19, 19).withOpacity(0.9),
              ],
            ),
          ),
          child: Column(
            children: [
              // Header
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isSmallScreen ? 16 : 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: isSmallScreen ? 30 : 60,
                            height: 2,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 16),
                          Flexible(
                            child: Text(
                              'BORNE DE DÉMONSTRATION NOUS',
                              style: TextStyle(
                                fontSize: isSmallScreen ? 16 : 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: isSmallScreen ? 30 : 60,
                            height: 2,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Borne de démonstration',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                    SizedBox(height: isSmallScreen ? 20 : 40),

                    // Logo
                    Container(
                      width: isSmallScreen ? 60 : 80,
                      height: isSmallScreen ? 60 : 80,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          'ℝ',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 30 : 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Options section
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(isSmallScreen ? 20 : 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'OÙ VOULEZ-VOUS CONSOMMEZ?',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromARGB(221, 183, 180, 180),
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: isSmallScreen ? 30 : 60),

                      isVerySmallScreen
                          ? Column(
                              children: [
                                _buildDiningOption(
                                  context,
                                  isSmallScreen: isSmallScreen,
                                  icon: Icons.restaurant,
                                  label: 'SUR PLACE',
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Text(
                                    '-OU-',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Color.fromARGB(137, 179, 178, 178),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                _buildDiningOption(
                                  context,
                                  isSmallScreen: isSmallScreen,
                                  icon: Icons.takeout_dining,
                                  label: 'À EMPORTER',
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildDiningOption(
                                  context,
                                  isSmallScreen: isSmallScreen,
                                  icon: Icons.restaurant,
                                  label: 'SUR PLACE',
                                ),
                                SizedBox(width: isSmallScreen ? 30 : 60),
                                const Text(
                                  '-OU-',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color:Color.fromARGB(221, 183, 180, 180),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(width: isSmallScreen ? 30 : 60),
                                _buildDiningOption(
                                  context,
                                  isSmallScreen: isSmallScreen,
                                  icon: Icons.takeout_dining,
                                  label: 'À EMPORTER',
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDiningOption(
    BuildContext context, {
    required bool isSmallScreen,
    required IconData icon,
    required String label,
  }) {
    final double containerSize = isSmallScreen ? 150 : 200;
    final double iconSize = isSmallScreen ? 40 : 60;
    final double circleSize = isSmallScreen ? 90 : 120;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      },
      child: Column(
        children: [
          Container(
            width: containerSize,
            height: containerSize,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: circleSize,
                  height: circleSize,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: iconSize, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFFF6B35),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 600;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'ℝ',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 20,
                              height: 1,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                'BORNE DE DÉMONSTRATION',
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 14 : 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 20,
                              height: 1,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Borne de démonstration',
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.home, color: Colors.white, size: 28),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),

            // Main content
            Expanded(
              child: _selectedIndex == 0
                  ? const MenuScreen()
                  : const CartScreen(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            // Menu button
            Expanded(
              child: GestureDetector(
                onTap: () => _onItemTapped(0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 0 ? Colors.grey : Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.menu_book,
                        color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                        size: 28,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'NOTRE CARTE',
                        style: TextStyle(
                          color: _selectedIndex == 0
                              ? Colors.white
                              : Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Cart button
            Expanded(
              child: GestureDetector(
                onTap: () => _onItemTapped(1),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    color: _selectedIndex == 1 ? Colors.grey : Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            color: _selectedIndex == 1
                                ? Colors.white
                                : Colors.grey,
                            size: 28,
                          ),
                          if (CartManager.cartItems.isNotEmpty)
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  CartManager.cartItems.length.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Text(
                        'PANIER',
                        style: TextStyle(
                          color: _selectedIndex == 1
                              ? Colors.white
                              : Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<Category> categories = [];
  bool isLoading = true;
  String selectedCategoryId = '';

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    setState(() {
      isLoading = true;
    });

    try {
      final fetchedCategories = await ApiService.getCategories();
      setState(() {
        categories = fetchedCategories.where((cat) => cat.visible).toList();
        if (categories.isNotEmpty) {
          selectedCategoryId = categories.first.id.toString();
        }
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors du chargement des catégories: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 600;

    if (isLoading) {
      return Container(
        color: Colors.white.withOpacity(0.95),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (categories.isEmpty) {
      return Container(
        color: Colors.white.withOpacity(0.95),
        child: const Center(
          child: Text(
            'Aucune catégorie disponible',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    if (isSmallScreen) {
      return Column(
        children: [
          // Categories horizontal scroll for small screens
          Container(
            height: 60,
            color: Colors.white.withOpacity(0.95),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategoryId == category.id.toString();
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategoryId = category.id.toString();
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 8,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFFF6B35)
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        category.name,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Category header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        categories
                            .firstWhere((c) => c.id.toString() == selectedCategoryId)
                            .imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        categories
                            .firstWhere((c) => c.id.toString() == selectedCategoryId)
                            .name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        categories
                            .firstWhere((c) => c.id.toString() == selectedCategoryId)
                            .description,
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Menu items grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: MenuItemsGrid(
                categoryId: selectedCategoryId,
                isSmallScreen: isSmallScreen,
              ),
            ),
          ),
        ],
      );
    }

    // Desktop layout
    return Row(
      children: [
        // Categories sidebar
        Container(
          width: 250,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                height: 92.4,
                padding: const EdgeInsets.all(16),
                child: const Row(
                  children: [
                    Icon(Icons.menu_book, size: 24, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      'Notre Carte',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    final isSelected = selectedCategoryId == category.id.toString();
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryId = category.id.toString();
                        });
                      },
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.only(bottom: 2),
                        decoration: BoxDecoration(
                          border: isSelected
                              ? const Border(
                                  left: BorderSide(
                                    color: Color(0xFFFF6B35),
                                    width: 4,
                                  ),
                                )
                              : null,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(category.imageUrl),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.7),
                                    BlendMode.darken,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                category.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w600,
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // Menu items
        Expanded(
          child: Container(
            color: const Color.fromARGB(255, 23, 18, 18).withOpacity(0.3),
            child: Column(
              children: [
                // Category header
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50.withOpacity(0.95),
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: NetworkImage(
                              categories
                                  .firstWhere((c) => c.id.toString() == selectedCategoryId)
                                  .imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categories
                                .firstWhere((c) => c.id.toString() == selectedCategoryId)
                                .name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            categories
                                .firstWhere((c) => c.id.toString() == selectedCategoryId)
                                .description,
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Menu items grid
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: MenuItemsGrid(
                      categoryId: selectedCategoryId,
                      isSmallScreen: isSmallScreen,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MenuItemsGrid extends StatefulWidget {
  final String categoryId;
  final bool isSmallScreen;

  const MenuItemsGrid({
    Key? key,
    required this.categoryId,
    required this.isSmallScreen,
  }) : super(key: key);

  @override
  State<MenuItemsGrid> createState() => _MenuItemsGridState();
}

class _MenuItemsGridState extends State<MenuItemsGrid> {
  List<MenuItem> items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  @override
  void didUpdateWidget(MenuItemsGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.categoryId != widget.categoryId) {
      _loadProducts();
    }
  }

  Future<void> _loadProducts() async {
    setState(() {
      isLoading = true;
    });

    try {
      final fetchedItems = await ApiService.getProductsByCategory(int.parse(widget.categoryId));
      setState(() {
        items = fetchedItems;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors du chargement des produits: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (items.isEmpty) {
      return const Center(
        child: Text(
          'Aucun produit disponible dans cette catégorie',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    final Size screenSize = MediaQuery.of(context).size;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(screenSize.width),
        childAspectRatio: _getAspectRatio(screenSize.width),
        crossAxisSpacing: widget.isSmallScreen ? 12 : 20,
        mainAxisSpacing: widget.isSmallScreen ? 12 : 20,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return MenuItemCard(item: items[index]);
      },
    );
  }

  int _getCrossAxisCount(double width) {
    if (width < 400) return 1;
    if (width < 600) return 2;
    if (width < 900) return 3;
    if (width < 1200) return 4;
    return 5;
  }

  double _getAspectRatio(double width) {
    if (width < 400) return 1.2;
    if (width < 600) return 0.85;
    return 0.8;
  }
}

class MenuItemCard extends StatefulWidget {
  final MenuItem item;

  const MenuItemCard({Key? key, required this.item}) : super(key: key);

  @override
  State<MenuItemCard> createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 600;
    final bool isVerySmall = screenSize.width < 400;
    final cartItem = CartManager.cartItems.firstWhere(
      (item) => item.item.id == widget.item.id,
      orElse: () => CartItem(item: widget.item, quantity: 0),
    );
    final quantity = cartItem.quantity;

    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image section
            Expanded(
              flex: isVerySmall ? 6 : 5,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.network(
                        widget.item.imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: Colors.grey.shade200,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Add button
                  Positioned(
                    right: 12,
                    bottom: 12,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          CartManager.addToCart(widget.item);
                        });
                      },
                      child: Container(
                        width: isSmallScreen ? 44 : 48,
                        height: isSmallScreen ? 44 : 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF6B35),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFF6B35).withOpacity(0.3),
                              blurRadius: 8,
                              spreadRadius: 2,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: isSmallScreen ? 20 : 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content section
            Flexible(
              flex: isVerySmall ? 4 : 3,
              child: Container(
                constraints: BoxConstraints(
                  minHeight: isVerySmall ? 60 : 80,
                ),
                padding: EdgeInsets.all(isVerySmall ? 6 : (isSmallScreen ? 8 : 10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Item name
                    Flexible(
                      child: Text(
                        widget.item.name,
                        style: TextStyle(
                          fontSize: isVerySmall ? 9 : (isSmallScreen ? 10 : 11),
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          height: 1.1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    
                    // Description
                    Flexible(
                      child: Text(
                        widget.item.description,
                        style: TextStyle(
                          fontSize: isVerySmall ? 7 : (isSmallScreen ? 8 : 9),
                          color: Colors.grey.shade600,
                          height: 1.1,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    
                    // Price section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            '${widget.item.price.toStringAsFixed(2)} €',
                            style: TextStyle(
                              fontSize: isVerySmall ? 10 : (isSmallScreen ? 11 : 12),
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF00BCD4),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (quantity > 0)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: isVerySmall ? 4 : 6,
                              vertical: isVerySmall ? 1 : 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00BCD4).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'x$quantity',
                              style: TextStyle(
                                fontSize: isVerySmall ? 6 : (isSmallScreen ? 7 : 8),
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFF00BCD4),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isProcessingOrder = false;

  Future<void> _processOrder() async {
    setState(() {
      isProcessingOrder = true;
    });

    try {
      // Create ticket
      final ticketId = await ApiService.createTicket();
      if (ticketId == null) {
        throw Exception('Failed to create ticket');
      }

      // Add all cart items to the ticket
      bool allItemsAdded = true;
      for (final cartItem in CartManager.cartItems) {
        final success = await ApiService.addProductToTicket(
          ticketId,
          cartItem.item.id,
          cartItem.quantity,
        );
        if (!success) {
          allItemsAdded = false;
          break;
        }
      }

      if (!allItemsAdded) {
        throw Exception('Failed to add some items to ticket');
      }

      // Show success and clear cart
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Commande #$ticketId créée avec succès!')),
      );
      
      CartManager.clearCart();
      setState(() {
        isProcessingOrder = false;
      });

    } catch (e) {
      setState(() {
        isProcessingOrder = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de la commande: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 600;

    if (CartManager.cartItems.isEmpty) {
      return Container(
        color: Colors.white.withOpacity(0.95),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: isSmallScreen ? 80 : 120,
                height: isSmallScreen ? 80 : 120,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: isSmallScreen ? 40 : 60,
                  color: Colors.grey.shade400,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Votre panier est vide',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Ajoutez des articles depuis le menu',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      color: Colors.white.withOpacity(0.95),
      child: Column(
        children: [
          // Cart header
          Container(
            padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
            child: Row(
              children: [
                const Icon(Icons.shopping_cart, size: 28),
                const SizedBox(width: 12),
                const Text(
                  'PANIER',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  '${CartManager.cartItems.length} articles',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),

          // Cart items
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 12 : 20,
              ),
              itemCount: CartManager.cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = CartManager.cartItems[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 5,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Item image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          cartItem.item.imageUrl,
                          width: isSmallScreen ? 50 : 60,
                          height: isSmallScreen ? 50 : 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: isSmallScreen ? 8 : 16),

                      // Quantity controls
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${cartItem.quantity}x',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: isSmallScreen ? 8 : 16),

                      // Item details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.item.name,
                              style: TextStyle(
                                fontSize: isSmallScreen ? 14 : 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),

                      // Price
                      Text(
                        '${(cartItem.item.price * cartItem.quantity).toStringAsFixed(2)} €',
                        style: TextStyle(
                          fontSize: isSmallScreen ? 14 : 16,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF00BCD4),
                        ),
                      ),
                      SizedBox(width: isSmallScreen ? 8 : 12),

                      // Delete button
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            CartManager.removeFromCart(cartItem.item.id);
                          });
                        },
                        child: Container(
                          width: isSmallScreen ? 28 : 32,
                          height: isSmallScreen ? 28 : 32,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: isSmallScreen ? 16 : 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Total and checkout
          Container(
            padding: EdgeInsets.all(isSmallScreen ? 16 : 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${CartManager.totalPrice.toStringAsFixed(2)} €',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00BCD4),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isSmallScreen ? 16 : 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isProcessingOrder ? null : _processOrder,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B35),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: isProcessingOrder
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'COMMANDER',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward, color: Colors.white),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
