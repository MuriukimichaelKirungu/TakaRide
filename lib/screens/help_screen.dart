import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final faqs = [
      {
        "question": "How do I request a pickup?",
        "answer": "Go to the home screen and tap on 'Request Now' to request an immediate pickup."
      },
      {
        "question": "Can I schedule a ride?",
        "answer": "Yes, tap on 'Schedule Pickup' and choose your preferred date and time."
      },
      {
        "question": "How do I reset my password?",
        "answer": "Use the 'Forgot Password?' option on the login screen to reset it."
      },
      {
        "question": "How do I contact support?",
        "answer": "Use the Support tab from the bottom navigation bar to reach us directly."
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Help & FAQs"),
        backgroundColor: const Color(0xFF27AE60),
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              faqs[index]['question']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(faqs[index]['answer']!),
              )
            ],
          );
        },
      ),
    );
  }
}
