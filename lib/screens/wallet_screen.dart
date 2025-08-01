import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        backgroundColor: const Color(0xFF27AE60),
      ),
      body: const Center(
        child: Text('Wallet Screen Placeholder'),
      ),
    );
  }
}
