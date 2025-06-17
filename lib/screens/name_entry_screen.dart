import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'payment_screen.dart';

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
