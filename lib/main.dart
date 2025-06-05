import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                'https://imgs.search.brave.com/0e9cUtB2CbWMg4MBAwFE68Uhky9qreOABdDbe9_tGP4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWdz/LnNlYXJjaC5icmF2/ZS5jb20vdlJob2xG/cWNtOWtwWUg1cU5P/YVdxM1lJWTUzQTZj/TFV5RjZtczRnczNk/by9yczpmaXQ6NTAw/OjA6MDowL2c6Y2Uv/YUhSMGNITTZMeTlw/TG5CcC9ibWx0Wnk1/amIyMHZiM0pwL1oy/bHVZV3h6TDJRM0wy/RmkvTHpBNEwyUTNZ/V0l3T0dabS9ORE0w/WVdVMFpqTTRPRGMx/L05qTmxOMll5WWpn/eFpERTUvTG1wd1p3',
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
                                'BORNE DE COMONDES',
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
                  child: Container(
                    //  color: Colors.white.withOpacity(0.95),
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
                            // border: Border.all(color: Colors.grey.shade300),
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
              'https://imgs.search.brave.com/0e9cUtB2CbWMg4MBAwFE68Uhky9qreOABdDbe9_tGP4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWdz/LnNlYXJjaC5icmF2/ZS5jb20vdlJob2xG/cWNtOWtwWUg1cU5P/YVdxM1lJWTUzQTZj/TFV5RjZtczRnczNk/by9yczpmaXQ6NTAw/OjA6MDowL2c6Y2Uv/YUhSMGNITTZMeTlw/TG5CcC9ibWx0Wnk1/amIyMHZiM0pwL1oy/bHVZV3h6TDJRM0wy/RmkvTHpBNEwyUTNZ/V0l3T0dabS9ORE0w/WVdVMFpqTTRPRGMx/L05qTmxOMll5WWpn/eFpERTUvTG1wd1p3',
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
              'https://imgs.search.brave.com/0e9cUtB2CbWMg4MBAwFE68Uhky9qreOABdDbe9_tGP4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWdz/LnNlYXJjaC5icmF2/ZS5jb20vdlJob2xG/cWNtOWtwWUg1cU5P/YVdxM1lJWTUzQTZj/TFV5RjZtczRnczNk/by9yczpmaXQ6NTAw/OjA6MDowL2c6Y2Uv/YUhSMGNITTZMeTlw/TG5CcC9ibWx0Wnk1/amIyMHZiM0pwL1oy/bHVZV3h6TDJRM0wy/RmkvTHpBNEwyUTNZ/V0l3T0dabS9ORE0w/WVdVMFpqTTRPRGMx/L05qTmxOMll5WWpn/eFpERTUvTG1wd1p3',
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
                    height: isSmallScreen ? 100 : 150,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'ℝ',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                        'NOTRE CART',
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
                        'CART',
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
  final List<Category> categories = [
    Category(
      id: '1',
      name: 'PIZZAS',
      icon: Icons.local_pizza,
      imageUrl:
          'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=1000',
    ),
    Category(
      id: '2',
      name: 'SANDWICHES',
      icon: Icons.lunch_dining,
      imageUrl:
          'https://images.unsplash.com/photo-1550507992-eb63ffee0847?q=80&w=1000',
    ),
    Category(
      id: '3',
      name: 'PLATS',
      icon: Icons.dinner_dining,
      imageUrl:
          'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?q=80&w=1000',
    ),
    Category(
      id: '4',
      name: 'MENUS',
      icon: Icons.restaurant_menu,
      imageUrl:
          'https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?q=80&w=1000',
    ),
    Category(
      id: '5',
      name: 'DESSERTS',
      icon: Icons.icecream,
      imageUrl:
          'https://images.unsplash.com/photo-1551024506-0bccd828d307?q=80&w=1000',
    ),
    Category(
      id: '6',
      name: 'BOISSONS',
      icon: Icons.local_drink,
      imageUrl:
          'https://images.unsplash.com/photo-1551024709-8f23befc6f87?q=80&w=1000',
    ),
  ];

  String selectedCategoryId = '1';

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 600;

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
                final isSelected = selectedCategoryId == category.id;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategoryId = category.id;
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
                            .firstWhere((c) => c.id == selectedCategoryId)
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
                            .firstWhere((c) => c.id == selectedCategoryId)
                            .name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Burger, Hot-dogs et Tacos Mexicains',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
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
                child: Row(
                  children: [
                    const Icon(Icons.menu_book, size: 24, color: Colors.grey),
                    const SizedBox(width: 10),
                    const Text(
                      'Notre Cart',
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
                    final isSelected = selectedCategoryId == category.id;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategoryId = category.id;
                        });
                      },
                      child: Container(
                        height: 150,
                        margin: const EdgeInsets.only(bottom: 2),
                        decoration: BoxDecoration(
                          border: isSelected
                              ? Border(
                                  left: BorderSide(
                                    color: const Color(0xFFFF6B35),
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
                                  .firstWhere((c) => c.id == selectedCategoryId)
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
                                .firstWhere((c) => c.id == selectedCategoryId)
                                .name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
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

class Category {
  final String id;
  final String name;
  final IconData icon;
  final String imageUrl;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.imageUrl,
  });
}

class MenuItemsGrid extends StatelessWidget {
  final String categoryId;
  final bool isSmallScreen;

  const MenuItemsGrid({
    Key? key,
    required this.categoryId,
    required this.isSmallScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MenuItem> items = getMenuItemsByCategory(categoryId);
    final Size screenSize = MediaQuery.of(context).size;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(screenSize.width),
        childAspectRatio: _getAspectRatio(screenSize.width),
        crossAxisSpacing: isSmallScreen ? 12 : 20,
        mainAxisSpacing: isSmallScreen ? 12 : 20,
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
    if (width < 400) return 1.2; // Taller cards for mobile
    if (width < 600) return 0.85;
    return 0.8; // Slightly taller for better proportions
  }

  List<MenuItem> getMenuItemsByCategory(String categoryId) {
    switch (categoryId) {
      case '2':
        return [
          MenuItem(
            id: '1',
            name: 'HOT-DOG',
            description: 'Saucisse de Francfort, pain brioché',
            price: 7.00,
            imageUrl:
                'https://images.unsplash.com/photo-1612392062631-94dd858cba88?q=80&w=1000',
          ),
          MenuItem(
            id: '2',
            name: 'Burger Classique',
            description: 'Steak haché, salade, tomate',
            price: 6.00,
            imageUrl:
                'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=1000',
          ),
          MenuItem(
            id: '3',
            name: 'Burger 300 gr',
            description: 'Double steak haché 150g',
            price: 8.00,
            imageUrl:
                'https://images.unsplash.com/photo-1553979459-d2229ba7433b?q=80&w=1000',
          ),
          MenuItem(
            id: '4',
            name: 'Double Cheese Burger',
            description: 'Double steak, double fromage',
            price: 8.00,
            imageUrl:
                'https://images.unsplash.com/photo-1607013251379-e6eecfffe234?q=80&w=1000',
          ),
          MenuItem(
            id: '5',
            name: 'Tacos Shawarma Grillé',
            description: 'Viande shawarma, légumes grillés',
            price: 7.50,
            imageUrl:
                'https://images.unsplash.com/photo-1599974579688-8dbdd335c77f?q=80&w=1000',
          ),
          MenuItem(
            id: '6',
            name: 'Tacos Simple',
            description: 'Viande au choix, légumes',
            price: 5.00,
            imageUrl:
                'https://images.unsplash.com/photo-1613514785940-daed07799d9b?q=80&w=1000',
          ),
          MenuItem(
            id: '7',
            name: 'Tacos Double',
            description: 'Double viande, légumes, fromage',
            price: 9.00,
            imageUrl:
                'https://images.unsplash.com/photo-1551504734-5ee1c4a3479c?q=80&w=1000',
          ),
        ];
      case '1':
        return [
          MenuItem(
            id: '8',
            name: 'Margherita',
            description: 'Tomate, mozzarella, basilic',
            price: 9.00,
            imageUrl:
                'https://images.unsplash.com/photo-1604068549290-dea0e4a305ca?q=80&w=1000',
          ),
          MenuItem(
            id: '9',
            name: 'Pepperoni',
            description: 'Tomate, mozzarella, pepperoni',
            price: 11.00,
            imageUrl:
                'https://images.unsplash.com/photo-1628840042765-356cda07504e?q=80&w=1000',
          ),
          MenuItem(
            id: '10',
            name: 'Quatre Fromages',
            description: 'Mozzarella, gorgonzola, parmesan',
            price: 12.00,
            imageUrl:
                'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=1000',
          ),
          MenuItem(
            id: '11',
            name: 'Végétarienne',
            description: 'Tomate, mozzarella, légumes grillés',
            price: 10.00,
            imageUrl:
                'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=1000',
          ),
        ];
      default:
        return [];
    }
  }
}

class MenuItem {
  final String id;
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
      child: IntrinsicHeight( // Added to prevent overflow
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image section
            Expanded(
              flex: isVerySmall ? 6 : 5, // More space for image on very small screens
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

                  // Gradient overlay for better text readability
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.1),
                        ],
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

            // Content section with flexible height
            Flexible( // Changed from Expanded to Flexible
              flex: isVerySmall ? 4 : 3, // Less space for content on very small screens
              child: Container(
                constraints: BoxConstraints(
                  minHeight: isVerySmall ? 60 : 80, // Minimum height to prevent too small content
                ),
                padding: EdgeInsets.all(isVerySmall ? 6 : (isSmallScreen ? 8 : 10)), // Reduced padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Changed to spaceEvenly for better distribution
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Item name
                    Flexible( // Made flexible to prevent overflow
                      child: Text(
                        widget.item.name,
                        style: TextStyle(
                          fontSize: isVerySmall ? 9 : (isSmallScreen ? 10 : 11), // Even smaller
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          height: 1.1, // Reduced line height
                        ),
                        maxLines: 1, // Always single line for consistency
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    
                    // Description
                    Flexible( // Made flexible to prevent overflow
                      child: Text(
                        widget.item.description,
                        style: TextStyle(
                          fontSize: isVerySmall ? 7 : (isSmallScreen ? 8 : 9), // Even smaller
                          color: Colors.grey.shade600,
                          height: 1.1, // Reduced line height
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
                        Flexible( // Made price flexible too
                          child: Text(
                            '${widget.item.price.toStringAsFixed(2)} €',
                            style: TextStyle(
                              fontSize: isVerySmall ? 10 : (isSmallScreen ? 11 : 12), // Smaller
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF00BCD4),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (quantity > 0)
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: isVerySmall ? 4 : 6, // Reduced padding
                              vertical: isVerySmall ? 1 : 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF00BCD4).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8), // Smaller radius
                            ),
                            child: Text(
                              'x$quantity',
                              style: TextStyle(
                                fontSize: isVerySmall ? 6 : (isSmallScreen ? 7 : 8), // Very small
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

  static void removeFromCart(String itemId) {
    _cartItems.removeWhere((cartItem) => cartItem.item.id == itemId);
  }

  static void updateQuantity(String itemId, int quantity) {
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

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                          '+ ${cartItem.quantity}x',
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
                        color: const Color(0xFF00BCD4),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isSmallScreen ? 16 : 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NameEntryScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B35),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SUIVANT',
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

class NameEntryScreen extends StatefulWidget {
  const NameEntryScreen({Key? key}) : super(key: key);

  @override
  State<NameEntryScreen> createState() => _NameEntryScreenState();
}

class _NameEntryScreenState extends State<NameEntryScreen> {
  String customerName = '';

  void _addLetter(String letter) {
    setState(() {
      customerName += letter;
    });
  }

  void _deleteLetter() {
    if (customerName.isNotEmpty) {
      setState(() {
        customerName = customerName.substring(0, customerName.length - 1);
      });
    }
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
              'https://imgs.search.brave.com/0e9cUtB2CbWMg4MBAwFE68Uhky9qreOABdDbe9_tGP4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWdz/LnNlYXJjaC5icmF2/ZS5jb20vdlJob2xG/cWNtOWtwWUg1cU5P/YVdxM1lJWTUzQTZj/TFV5RjZtczRnczNk/by9yczpmaXQ6NTAw/OjA6MDowL2c6Y2Uv/YUhSMGNITTZMeTlw/TG5CcC9ibWx0Wnk1/amIyMHZiM0pwL1oy/bHVZV3h6TDJRM0wy/RmkvTHpBNEwyUTNZ/V0l3T0dabS9ORE0w/WVdVMFpqTTRPRGMx/L05qTmxOMll5WWpn/eFpERTUvTG1wd1p3',
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
                Colors.black.withOpacity(0.6),
                const Color.fromARGB(255, 46, 44, 44).withOpacity(0.9),
              ],
            ),
          ),
          child: Column(
            children: [
              // Header section
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Bon appétit illustration
                    Container(
                      width: isSmallScreen ? 110 : 122,
                      height: isSmallScreen ? 110 : 122,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          'Bon\nappétit',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 20 : 30),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF6B35),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        'ENTREZ VOTRE NOM',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Name input section
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.all(isSmallScreen ? 20 : 40),
                  child: Column(
                    children: [
                      // Name display
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: const Color.fromARGB(255, 246, 241, 241),
                              width: 2,
                            ),
                          ),
                        ),
                        child: Text(
                          customerName.isEmpty ? '|' : customerName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 247, 246, 244),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: isSmallScreen ? 20 : 40),

                      // Action buttons
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                side: const BorderSide(color: Colors.grey),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'RETOUR',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: customerName.isNotEmpty
                                  ? () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PaymentScreen(
                                            customerName: customerName,
                                          ),
                                        ),
                                      );
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF00BCD4),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'CONTINUER',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Virtual keyboard
              Container(
                color: Colors.grey.shade200,
                padding: EdgeInsets.all(isSmallScreen ? 10 : 20),
                child: isSmallScreen
                    ? _buildCompactKeyboard()
                    : _buildFullKeyboard(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCompactKeyboard() {
    return Column(
      children: [
        // First row
        Row(
          children: [
            _buildKey('A'),
            _buildKey('Z'),
            _buildKey('E'),
            _buildKey('R'),
            _buildKey('T'),
            _buildKey('Y'),
            _buildKey('U'),
            _buildKey('I'),
            _buildKey('O'),
            _buildKey('P'),
          ],
        ),
        const SizedBox(height: 4),
        // Second row
        Row(
          children: [
            _buildKey('Q'),
            _buildKey('S'),
            _buildKey('D'),
            _buildKey('F'),
            _buildKey('G'),
            _buildKey('H'),
            _buildKey('J'),
            _buildKey('K'),
            _buildKey('L'),
          ],
        ),
        const SizedBox(height: 4),
        // Third row
        Row(
          children: [
            _buildKey('W'),
            _buildKey('X'),
            _buildKey('C'),
            _buildKey('V'),
            _buildKey('B'),
            _buildKey('N'),
            _buildKey('M'),
            _buildDeleteKey(),
          ],
        ),
        const SizedBox(height: 4),
        // Space bar
        Row(children: [Expanded(child: _buildSpaceKey())]),
      ],
    );
  }

  Widget _buildFullKeyboard() {
    return Column(
      children: [
        // First row
        Row(
          children: [
            _buildKey('A'),
            _buildKey('Z'),
            _buildKey('E'),
            _buildKey('R'),
            _buildKey('T'),
            _buildKey('Y'),
            _buildKey('U'),
            _buildKey('I'),
            _buildKey('O'),
            _buildKey('P'),
          ],
        ),
        const SizedBox(height: 8),
        // Second row
        Row(
          children: [
            _buildKey('Q'),
            _buildKey('S'),
            _buildKey('D'),
            _buildKey('F'),
            _buildKey('G'),
            _buildKey('H'),
            _buildKey('J'),
            _buildKey('K'),
            _buildKey('L'),
            _buildKey('M'),
          ],
        ),
        const SizedBox(height: 8),
        // Third row
        Row(
          children: [
            _buildKey('W'),
            _buildKey('X'),
            _buildKey('C'),
            _buildKey('V'),
            _buildKey('B'),
            _buildKey('N'),
            _buildDeleteKey(),
          ],
        ),
        const SizedBox(height: 8),
        // Space bar
        Row(children: [Expanded(child: _buildSpaceKey())]),
      ],
    );
  }

  Widget _buildKey(String letter) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _addLetter(letter),
        child: Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Center(
            child: Text(
              letter,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteKey() {
    return Expanded(
      child: GestureDetector(
        onTap: _deleteLetter,
        child: Container(
          margin: const EdgeInsets.all(2),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.red.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red.shade300),
          ),
          child: const Center(
            child: Icon(Icons.backspace, color: Colors.red, size: 20),
          ),
        ),
      ),
    );
  }

  Widget _buildSpaceKey() {
    return GestureDetector(
      onTap: () => _addLetter(' '),
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: const Center(
          child: Text(
            'ESPACE',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  final String customerName;

  const PaymentScreen({Key? key, required this.customerName}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedPaymentMethod = 'card';

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 600;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://imgs.search.brave.com/0e9cUtB2CbWMg4MBAwFE68Uhky9qreOABdDbe9_tGP4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWdz/LnNlYXJjaC5icmF2/ZS5jb20vdlJob2xG/cWNtOWtwWUg1cU5P/YVdxM1lJWTUzQTZj/TFV5RjZtczRnczNk/by9yczpmaXQ6NTAw/OjA6MDowL2c6Y2Uv/YUhSMGNITTZMeTlw/TG5CcC9ibWx0Wnk1/amIyMHZiM0pwL1oy/bHVZV3h6TDJRM0wy/RmkvTHpBNEwyUTNZ/V0l3T0dabS9ORE0w/WVdVMFpqTTRPRGMx/L05qTmxOMll5WWpn/eFpERTUvTG1wd1p3',
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
                Colors.black.withOpacity(0.6),
                const Color.fromARGB(255, 27, 26, 26).withOpacity(0.95),
              ],
            ),
          ),
          child: Column(
            children: [
              // Header
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 20,
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 28,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Spacer(),
                        Text(
                          'Bonjour ${widget.customerName}',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(width: 48), // Balance the back button
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF6B35),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        'CHOISISSEZ VOTRE MODE DE PAIEMENT',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Payment methods
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(isSmallScreen ? 20 : 40),
                  child: Column(
                    children: [
                      // Order summary
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
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
                            const Text(
                              'RÉCAPITULATIF DE VOTRE COMMANDE',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ...CartManager.cartItems.map(
                              (cartItem) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '${cartItem.quantity}x ${cartItem.item.name}',
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      '${(cartItem.item.price * cartItem.quantity).toStringAsFixed(2)} €',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'TOTAL',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${CartManager.totalPrice.toStringAsFixed(2)} €',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00BCD4),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: isSmallScreen ? 30 : 40),

                      // Payment methods
                      Row(
                        children: [
                          Expanded(
                            child: _buildPaymentMethod(
                              'card',
                              'CARTE BANCAIRE',
                              Icons.credit_card,
                              isSmallScreen,
                            ),
                          ),
                          SizedBox(width: isSmallScreen ? 16 : 20),
                          Expanded(
                            child: _buildPaymentMethod(
                              'cash',
                              'ESPÈCES',
                              Icons.money,
                              isSmallScreen,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: isSmallScreen ? 30 : 40),

                      // Pay button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _showOrderConfirmation(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00BCD4),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'PAYER ${CartManager.totalPrice.toStringAsFixed(2)} €',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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

  Widget _buildPaymentMethod(
    String method,
    String label,
    IconData icon,
    bool isSmallScreen,
  ) {
    final isSelected = selectedPaymentMethod == method;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = method;
        });
      },
      child: Container(
        padding: EdgeInsets.all(isSmallScreen ? 20 : 30),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF6B35) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFFFF6B35) : Colors.grey.shade300,
            width: 2,
          ),
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
            Icon(
              icon,
              size: isSmallScreen ? 40 : 60,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            SizedBox(height: isSmallScreen ? 12 : 16),
            Text(
              label,
              style: TextStyle(
                fontSize: isSmallScreen ? 14 : 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showOrderConfirmation(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00BCD4),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 50),
                ),
                const SizedBox(height: 20),
                const Text(
                  'COMMANDE CONFIRMÉE',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00BCD4),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Merci ${widget.customerName}!',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Votre commande sera prête dans 15-20 minutes.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      CartManager.clearCart();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B35),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'BACK TO HOME PAGE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
