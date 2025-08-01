import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        backgroundColor: const Color(0xFF27AE60),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "TakaRide",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Version 1.0.0",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 24),
            Text(
              "TakaRide is a modern waste pickup solution designed to connect households and businesses with efficient and reliable waste collection services. We aim to create cleaner cities by simplifying trash management and providing timely pickups.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 32),
            Text(
              "Developed by:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text("• Your Company Name"),
            Text("• support@takaride.com"),
          ],
        ),
      ),
    );
  }
}
