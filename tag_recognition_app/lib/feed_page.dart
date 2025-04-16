import 'package:flutter/material.dart';

class ReclaimScreen extends StatefulWidget {
  @override
  _ReclaimScreenState createState() => _ReclaimScreenState();
}

class _ReclaimScreenState extends State<ReclaimScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Profile Section with SafeArea
                SafeArea(
                  bottom: false,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Reclaim Title
                        const Text(
                          'Reclaim',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Profile and Stats Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Profile and Scans This Month
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundImage: NetworkImage(
                                    'https://via.placeholder.com/150', // Replace with actual profile image URL
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '@Username',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      '7 Scans this month',
                                      style: TextStyle(fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Total Scans and Premium Button
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  '10 Total scans with plan',
                                  style: TextStyle(fontSize: 12, color: Colors.grey),
                                ),
                                const SizedBox(height: 8),
                                ElevatedButton(
                                  onPressed: () {
                                    // Add functionality for upgrading to premium
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green[400],
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 12,
                                    ),
                                    textStyle: const TextStyle(fontSize: 12),
                                  ),
                                  child: const Text('Upgrade to Premium'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // For You Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'For you',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      _buildItemCard(
                        title: 'Vintage Denim Jacket - Gently Used',
                        location: 'Urban Revival Thrift - 1032 Elmwood Ave.',
                        description:
                            'Classic Levi\'s light-wash denim jacket from the 90s with distressed detailing and silver buttons. A timeless wardrobe staple.',
                        price: '\$25',
                        imageUrl: 'https://via.placeholder.com/100', // Replace with actual URL
                      ),
                      const SizedBox(height: 12),
                      _buildItemCard(
                        title: 'High-Waisted Corduroy Pants - New',
                        location: 'Second Chance Threads - 598 Pine St.',
                        description:
                            'Rich burgundy corduroys with a tapered leg and retro brass buttons. Super soft and perfect for fall outfits.',
                        price: '\$18',
                        imageUrl: 'https://via.placeholder.com/100', // Replace with actual URL
                      ),
                      const SizedBox(height: 12),
                      _buildItemCard(
                        title: 'Oversized Plaid Flannel - Used',
                        location: 'Retro Rock Thrift - 2226 Grove Ave.',
                        description:
                            'Cozy 100% cotton flannel in forest green and navy tones. Great for layering or wearing solo with jeans.',
                        price: '\$12',
                        imageUrl: 'https://via.placeholder.com/100', // Replace with actual URL
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Floating Camera Button
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                // Add functionality for scanning a tag
              },
              backgroundColor: Colors.green[400],
              child: const Icon(Icons.camera_alt, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemCard({
    required String title,
    required String location,
    required String description,
    required String price,
    required String imageUrl,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported_outlined),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Location: $location',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Price: $price',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}