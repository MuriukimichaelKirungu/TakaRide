import 'package:flutter/material.dart';

class VehicleSelectionScreen extends StatelessWidget {
  const VehicleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vehicleOptions = [
      {'type': 'Bike', 'price': 'KES 100', 'icon': Icons.pedal_bike},
      {'type': 'TukTuk', 'price': 'KES 150', 'icon': Icons.electric_rickshaw},
      {'type': 'Car', 'price': 'KES 250', 'icon': Icons.directions_car},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose Vehicle"),
        backgroundColor: const Color(0xFF27AE60),
      ),
      body: ListView.builder(
        itemCount: vehicleOptions.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final vehicle = vehicleOptions[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: Icon(vehicle['icon'] as IconData, color: const Color(0xFF27AE60), size: 32),
              title: Text(vehicle['type'] as String, style: const TextStyle(fontSize: 18)),
              subtitle: Text(vehicle['price'] as String),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // TODO: Proceed to ride confirmation/receipt screen
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${vehicle['type']} selected")),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
