import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:takaride/screens/payment_screen.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _locationController = TextEditingController();
  final _volumeController = TextEditingController();

  String? _selectedPitType;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  File? _imageFile;

  final List<String> _pitTypes = [
    "Septic Tank",
    "Pit Latrine",
    "Biodigester",
    "Other"
  ];

  @override
  void initState() {
    super.initState();
    _volumeController.addListener(() {
      setState(() {}); // Rebuild UI to update cost when volume changes
    });
  }

  @override
  void dispose() {
    _locationController.dispose();
    _volumeController.dispose();
    super.dispose();
  }

  void _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date != null) setState(() => _selectedDate = date);
  }

  void _pickTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 9, minute: 0),
    );
    if (time != null) setState(() => _selectedTime = time);
  }

  void _pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => _imageFile = File(picked.path));
  }

  double calculateCost() {
    final volume = double.tryParse(_volumeController.text) ?? 0;
    return 1500 + (volume * 0.5);
  }

  @override
  Widget build(BuildContext context) {
    final String dateLabel = _selectedDate != null
        ? DateFormat.yMMMd().format(_selectedDate!)
        : 'Select Date';

    final String timeLabel =
    _selectedTime != null ? _selectedTime!.format(context) : 'Select Time';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Book a Pickup"),
        backgroundColor: const Color(0xFF27AE60),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Location"),
            const SizedBox(height: 4),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                hintText: "Enter location or estate",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            const Text("Pit Type"),
            const SizedBox(height: 4),
            DropdownButtonFormField<String>(
              value: _selectedPitType,
              items: _pitTypes.map((type) {
                return DropdownMenuItem(value: type, child: Text(type));
              }).toList(),
              onChanged: (val) => setState(() => _selectedPitType = val),
              decoration: const InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),

            const Text("Approximate Volume (litres)"),
            const SizedBox(height: 4),
            TextField(
              controller: _volumeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "e.g. 5000",
                border: OutlineInputBorder(),
              ),
            ),

            // Show estimated cost
            if (_volumeController.text.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                "Estimated Cost: KES ${calculateCost().toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _pickDate,
                    child: Text(dateLabel),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _pickTime,
                    child: Text(timeLabel),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            const Text("Upload Site Photo (Optional)"),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[100],
                ),
                child: _imageFile != null
                    ? Image.file(_imageFile!, fit: BoxFit.cover)
                    : const Center(child: Icon(Icons.camera_alt, size: 40)),
              ),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                if (_locationController.text.isEmpty ||
                    _selectedPitType == null ||
                    _volumeController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill in all fields")),
                  );
                  return;
                }

                final double volume = double.tryParse(_volumeController.text) ?? 0;
                final double cost = calculateCost();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PaymentScreen(
                      location: _locationController.text,
                      pitType: _selectedPitType!,
                      volume: volume,
                      cost: cost,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF27AE60),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Center(
                child: Text("Confirm Booking & Proceed to Payment"),
              ),
            )

          ],
        ),
      ),
    );
  }
}
