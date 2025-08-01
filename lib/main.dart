import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const TakaRideApp());
}

class TakaRideApp extends StatelessWidget {
  const TakaRideApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TakaRide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Inter'),
      home: const LoginScreen(), // App starts at Login
    );
  }
}
