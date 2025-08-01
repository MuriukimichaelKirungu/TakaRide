import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
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
              "By using the TakaRide app, you agree to be bound by these terms and conditions...",
            ),
            SizedBox(height: 16),
            Text(
              "2. User Responsibilities",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "You are responsible for maintaining the confidentiality of your login information...",
            ),
            SizedBox(height: 16),
            Text(
              "3. Service Usage",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "TakaRide reserves the right to modify, suspend, or discontinue the service at any time...",
            ),
            SizedBox(height: 16),
            Text(
              "4. Contact Us",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "If you have any questions regarding these terms, please contact our support team.",
            ),
          ],
        ),
      ),
    );
  }
}
