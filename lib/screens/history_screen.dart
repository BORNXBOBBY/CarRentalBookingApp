import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/booking_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingProvider = Provider.of<BookingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Booking History",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: bookingProvider.bookingHistory.isEmpty
          ? const Center(
        child: Text(
          "No bookings yet!",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bookingProvider.bookingHistory.length,
        itemBuilder: (context, index) {
          final booking =
          bookingProvider.bookingHistory[index]; // Map

          final car = booking['car'];
          final userName = booking['userName'];
          final pickupDate = booking['pickupDate'];
          final location = booking['location'];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  car.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.directions_car,
                      size: 50, color: Colors.grey),
                ),
              ),
              title: Text("${car.brand} ${car.model}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              subtitle: Text(
                  "Booked by $userName\nPickup: $pickupDate\nLocation: $location",
                  style: const TextStyle(fontSize: 14)),
              isThreeLine: true,
              trailing: const Icon(Icons.history, color: Colors.orange),
            ),
          );
        },
      ),
    );
  }
}
