import 'package:flutter/material.dart';

class SchedulePickupScreen extends StatelessWidget {
  const SchedulePickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Pickup'),
        backgroundColor: const Color(0xFF27AE60),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.schedule, size: 100, color: Colors.grey),
            const SizedBox(height: 20),
            const Text(
              "Schedule Pickup Screen",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF27AE60),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text("Go Back", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
// TODO Implement this library.