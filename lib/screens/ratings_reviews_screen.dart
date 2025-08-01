import 'package:flutter/material.dart';

class RatingsReviewsScreen extends StatelessWidget {
  const RatingsReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ratings & Reviews'),
        backgroundColor: const Color(0xFF27AE60),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAverageRating(),
          const SizedBox(height: 24),
          const Text(
            'Recent Reviews',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildReviewTile(
            name: 'Jane W.',
            rating: 5,
            review: 'Great driver, very polite and helpful. Clean car!',
          ),
          _buildReviewTile(
            name: 'Mark K.',
            rating: 4,
            review: 'Ride was smooth but arrived a bit late.',
          ),
          _buildReviewTile(
            name: 'Alice N.',
            rating: 5,
            review: 'Always my go-to driver. Reliable and professional.',
          ),
        ],
      ),
    );
  }

  Widget _buildAverageRating() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF27AE60)),
      ),
      child: Column(
        children: [
          const Text(
            'Average Rating',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 8),
          const Text(
            '4.7',
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Color(0xFF27AE60)),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Icon(
                index < 4 ? Icons.star : Icons.star_half,
                color: Colors.orange,
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewTile({required String name, required int rating, required String review}) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF27AE60),
          child: Text(name[0]),
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  size: 18,
                  color: Colors.orange,
                );
              }),
            ),
            const SizedBox(height: 4),
            Text(review),
          ],
        ),
      ),
    );
  }
}
