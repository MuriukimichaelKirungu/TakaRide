import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class OsmMapScreen extends StatelessWidget {
  const OsmMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LatLng nairobiCenter = LatLng(-1.2921, 36.8219);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Trucks'),
        backgroundColor: const Color(0xFF27AE60),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: nairobiCenter,
          initialZoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.takaride',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: nairobiCenter,
                width: 40,
                height: 40,
                child: const Icon(
                  Icons.location_on,
                  size: 40,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
