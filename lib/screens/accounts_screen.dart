import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'wallet_screen.dart';
import 'settings_screen.dart';
import 'privacy_screen.dart';
import 'terms_conditions_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tileStyle = TextStyle(fontSize: 16, color: Colors.grey[800]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        backgroundColor: const Color(0xFF27AE60),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: Text("Profile", style: tileStyle),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: Text("Wallet", style: tileStyle),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const WalletScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text("Settings", style: tileStyle),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: Text("Privacy Policy", style: tileStyle),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PrivacyScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: Text("Terms & Conditions", style: tileStyle),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TermsConditionsScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
