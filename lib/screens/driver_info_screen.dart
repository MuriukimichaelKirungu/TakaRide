import 'package:flutter/material.dart';

class DriverInfoScreen extends StatelessWidget {
  const DriverInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Info'),
        backgroundColor: const Color(0xFF27AE60),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/driver_avatar.png'), // Replace with your driver image
            ),
            const SizedBox(height: 16),
            const Text(
              'John Mwangi',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              '5 years experience',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.star, color: Colors.orange),
                Icon(Icons.star, color: Colors.orange),
                Icon(Icons.star, color: Colors.orange),
                Icon(Icons.star, color: Colors.orange),
                Icon(Icons.star_half, color: Colors.orange),
                SizedBox(width: 8),
                Text('4.5 Rating'),
              ],
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.phone, color: Color(0xFF27AE60)),
              title: const Text('Phone'),
              subtitle: const Text('+254 712 345 678'),
              trailing: IconButton(
                icon: const Icon(Icons.call, color: Color(0xFF27AE60)),
                onPressed: () {
                  // TODO: handle call
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.directions_car, color: Color(0xFF27AE60)),
              title: const Text('Vehicle'),
              subtitle: const Text('Toyota Probox - KDA 123X'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.verified_user, color: Color(0xFF27AE60)),
              title: const Text('License No'),
              subtitle: const Text('DL-98234-KE'),
            ),
          ],
        ),
      ),
    );
  }
}
