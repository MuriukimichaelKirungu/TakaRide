import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final bool isScheduled;

  const BookingScreen({
    Key? key,
    this.isScheduled = false,
  }) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String _selectedRideType = 'Standard';
  final List<String> _rideTypes = ['Standard', 'Premium', 'Bike'];
  double _estimatedFare = 0.0;

  void _calculateFare() {
    setState(() {
      switch (_selectedRideType) {
        case 'Standard':
          _estimatedFare = 5.0;
          break;
        case 'Premium':
          _estimatedFare = 9.0;
          break;
        case 'Bike':
          _estimatedFare = 3.0;
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _calculateFare();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text(widget.isScheduled ? 'Schedule a Ride' : 'Request a Ride'),
        backgroundColor: const Color(0xFF27AE60),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Choose Ride Type',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: _rideTypes.map((type) {
                return ChoiceChip(
                  label: Text(type),
                  selected: _selectedRideType == type,
                  onSelected: (_) {
                    setState(() {
                      _selectedRideType = type;
                      _calculateFare();
                    });
                  },
                  selectedColor: const Color(0xFF27AE60),
                  labelStyle: TextStyle(
                      color: _selectedRideType == type
                          ? Colors.white
                          : Colors.black),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text('Estimated Fare: \$${_estimatedFare.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 16)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(widget.isScheduled
                          ? 'Scheduled ride confirmed'
                          : 'Ride requested successfully')));
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF27AE60),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(widget.isScheduled ? 'Confirm Schedule' : 'Confirm'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
