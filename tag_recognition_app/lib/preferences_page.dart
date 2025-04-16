import 'package:flutter/material.dart';
import 'feed_page.dart';

class PreferencesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reclaim'),
        backgroundColor: Colors.green[400],
      ),
      body: Container(
        color: Colors.green[400], // Green background
        child: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[600],
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThriftingPreferencesPage()),
              );
            },
            child: const Text(
              'Start Preferences',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

class ThriftingPreferencesPage extends StatelessWidget {
  final List<String> sampleTags = [
    'Women\'s Attire',
    'Men\'s Attire',
    'Gender-Neutral',
    'Baby',
    'Youth'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thrifting Preferences'),
        backgroundColor: Colors.green[400],
      ),
      body: Container(
        color: Colors.green[400], // Green background
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Thrifting Preferences',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: sampleTags
                    .map(
                      (tag) => Chip(
                        label: Text(tag),
                        backgroundColor: Colors.white,
                        labelStyle: const TextStyle(color: Colors.black),
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StylesPage()),
                    );
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StylesPage extends StatelessWidget {
  final List<String> styles = ['Modern', 'Minimalist', 'Bohemian', 'Vintage'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Styles'),
        backgroundColor: Colors.green[400],
      ),
      body: Container(
        color: Colors.green[400], // Green background
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Styles',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: styles
                    .map(
                      (style) => Chip(
                        label: Text(style),
                        backgroundColor: Colors.white,
                        labelStyle: const TextStyle(color: Colors.black),
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ClothingTypesPage()),
                    );
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClothingTypesPage extends StatelessWidget {
  final List<String> clothingTypes = ['Tops', 'Bottoms', 'Dresses'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clothing Types'),
        backgroundColor: Colors.green[400],
      ),
      body: Container(
        color: Colors.green[400], // Green background
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Clothing Types',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: clothingTypes
                    .map(
                      (type) => Chip(
                        label: Text(type),
                        backgroundColor: Colors.white,
                        labelStyle: const TextStyle(color: Colors.black),
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MaterialPage()),
                    );
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MaterialPage extends StatelessWidget {
  final List<String> materials = ['Denim', 'Leather', 'Cotton'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material'),
        backgroundColor: Colors.green[400],
      ),
      body: Container(
        color: Colors.green[400], // Green background
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Materials',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: materials
                    .map(
                      (material) => Chip(
                        label: Text(material),
                        backgroundColor: Colors.white,
                        labelStyle: const TextStyle(color: Colors.black),
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BudgetPage()),
                    );
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BudgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget'),
        backgroundColor: Colors.green[400],
      ),
      body: Container(
        color: Colors.green[400], // Green background
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter Your Budget',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Enter your budget',
                  labelStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ReclaimScreen()),
                    );
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}