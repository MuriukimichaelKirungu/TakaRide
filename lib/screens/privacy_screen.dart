import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        backgroundColor: const Color(0xFF27AE60),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              "1. Introduction",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "This Privacy Policy explains how TakaRide collects, uses, and discloses your personal information.",
            ),
            SizedBox(height: 16),
            Text(
              "2. Information We Collect",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "We may collect your name, phone number, location data, and usage patterns.",
            ),
            SizedBox(height: 16),
            Text(
              "3. How We Use Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "The information we collect is used to provide ride services, customer support, and improve the app experience.",
            ),
            SizedBox(height: 16),
            Text(
              "4. Sharing of Data",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "We do not share your data with third parties except as required by law or with your consent.",
            ),
            SizedBox(height: 16),
            Text(
              "5. Contact Us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "If you have any questions about this Privacy Policy, contact our support team.",
            ),
          ],
        ),
      ),
    );
  }
}
