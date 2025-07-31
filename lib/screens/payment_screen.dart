import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final String location;
  final String pitType;
  final double volume;
  final double cost;

  const PaymentScreen({
    super.key,
    required this.location,
    required this.pitType,
    required this.volume,
    required this.cost,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedPaymentMethod = "M-Pesa";
  bool _agreedToTerms = false;

  void _handlePayment() {
    if (!_agreedToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please agree to terms and conditions.")),
      );
      return;
    }

    // TODO: Integrate M-Pesa or redirect to payment confirmation
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Payment Initiated"),
        content: Text("Payment method: $_selectedPaymentMethod"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: const Color(0xFF27AE60),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Booking Summary", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _summaryRow("Location", widget.location),
            _summaryRow("Pit Type", widget.pitType),
            _summaryRow("Volume", "${widget.volume.toStringAsFixed(0)} litres"),
            _summaryRow("Cost", "KES ${widget.cost.toStringAsFixed(2)}"),
            const Divider(height: 32),

            const Text("Choose Payment Method"),
            const SizedBox(height: 8),
            RadioListTile(
              value: "M-Pesa",
              groupValue: _selectedPaymentMethod,
              onChanged: (val) => setState(() => _selectedPaymentMethod = val!),
              title: const Text("M-Pesa"),
            ),
            RadioListTile(
              value: "Card",
              groupValue: _selectedPaymentMethod,
              onChanged: (val) => setState(() => _selectedPaymentMethod = val!),
              title: const Text("Credit/Debit Card (Coming Soon)"),
            ),
            RadioListTile(
              value: "Cash",
              groupValue: _selectedPaymentMethod,
              onChanged: (val) => setState(() => _selectedPaymentMethod = val!),
              title: const Text("Pay on Arrival"),
            ),

            const SizedBox(height: 16),
            Row(
              children: [
                Checkbox(
                  value: _agreedToTerms,
                  onChanged: (val) => setState(() => _agreedToTerms = val!),
                ),
                const Expanded(child: Text("I agree to the terms and conditions")),
              ],
            ),
            const Spacer(),

            ElevatedButton(
              onPressed: _handlePayment,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF27AE60),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Pay Now"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
