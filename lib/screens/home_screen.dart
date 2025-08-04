import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'osm_map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  LatLng? _currentLatLng;

  @override
  void initState() {
    super.initState();
    _fetchCurrentLocation();
  }

  Future<void> _fetchCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse || permission == LocationPermission.always) {
      final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      final latLng = LatLng(position.latitude, position.longitude);
      setState(() => _currentLatLng = latLng);

      final placemarks = await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        _locationController.text = "${place.street}, ${place.locality}";
      }
    }
  }

  List<Marker> _buildVehicleMarkers(LatLng center) {
    final double offset = 0.0015;
    return [
      LatLng(center.latitude + offset, center.longitude + offset),
      LatLng(center.latitude - offset, center.longitude - offset),
      LatLng(center.latitude + offset, center.longitude - offset),
      LatLng(center.latitude - offset, center.longitude + offset),
    ].map((vehiclePos) {
      return Marker(
        width: 32,
        height: 32,
        point: vehiclePos,
        child: const Icon(Icons.local_taxi, color: Colors.black, size: 32),
      );
    }).toList();
  }

  void _showRideSummary() {
    final pickup = _locationController.text.trim();
    final destination = _destinationController.text.trim();

    if (pickup.isEmpty || destination.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both pickup and destination')),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirm Ride"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Pickup: $pickup"),
            Text("Destination: $destination"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Trigger actual ride request later here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ride requested successfully!')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF27AE60)),
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: _locationController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.my_location),
                      hintText: "Pickup location",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _destinationController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.location_on),
                      hintText: "Destination",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: _currentLatLng == null
                    ? const Center(child: CircularProgressIndicator())
                    : FlutterMap(
                  options: MapOptions(
                    center: _currentLatLng,
                    zoom: 15.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          width: 40,
                          height: 40,
                          point: _currentLatLng!,
                          child: const Icon(Icons.location_pin, color: Colors.red, size: 40),
                        ),
                        ..._buildVehicleMarkers(_currentLatLng!),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _showRideSummary,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF27AE60),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text("Request Now", style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const OsmMapScreen()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        side: const BorderSide(color: Color(0xFF27AE60)),
                      ),
                      child: const Text("Schedule Pickup", style: TextStyle(fontSize: 16, color: Color(0xFF27AE60))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
