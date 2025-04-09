import 'package:flutter/material.dart';
import 'tag_scanner_page.dart';
import 'welcome_page.dart';

void main() => runApp(const TagRecognitionApp());

class TagRecognitionApp extends StatelessWidget {
  const TagRecognitionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reclaim',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.green, // Replaced gradient with solid green color
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/reclaim_logo.png', // Ensure the image is added to assets
                  width: 180,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to a new thrifting experience',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[400],
                    foregroundColor: Color(0xFFEFEFEF), // Softer white for text
                    side: const BorderSide(color: Color(0xFFEFEFEF), width: 2), // Softer white outline
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    );
                  },
                  child: const Text('Get Started'),
                ),
                const SizedBox(height: 15),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xFFEFEFEF), // Softer white text
                    side: const BorderSide(color: Color(0xFFEFEFEF), width: 2), // Softer white outline
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    );
                  },
                  child: const Text('Learn More'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}