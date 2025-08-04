class Booking {
  final String id; // Optional for backend reference
  final String rideType;
  final String pickup;
  final String destination;
  final DateTime dateTime;
  final bool scheduled;
  final double price;
  final String status; // e.g., pending, confirmed, completed

  Booking({
    this.id = '',
    required this.rideType,
    required this.pickup,
    required this.destination,
    required this.dateTime,
    required this.scheduled,
    required this.price,
    this.status = 'pending',
  });

  // For local storage or API
  Map<String, dynamic> toJson() => {
    'id': id,
    'rideType': rideType,
    'pickup': pickup,
    'destination': destination,
    'dateTime': dateTime.toIso8601String(),
    'scheduled': scheduled,
    'price': price,
    'status': status,
  };

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json['id'] ?? '',
    rideType: json['rideType'],
    pickup: json['pickup'],
    destination: json['destination'],
    dateTime: DateTime.parse(json['dateTime']),
    scheduled: json['scheduled'] ?? false,
    price: (json['price'] ?? 0).toDouble(),
    status: json['status'] ?? 'pending',
  );
}
