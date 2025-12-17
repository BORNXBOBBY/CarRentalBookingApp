import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/car_model.dart';
import '../providers/booking_provider.dart';
import 'car_detail_screen.dart';
import 'history_screen.dart';
import 'login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarListScreen extends StatefulWidget {
  const CarListScreen({Key? key}) : super(key: key);

  @override
  State<CarListScreen> createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  List<Car> displayedCars = [];

  @override
  void initState() {
    super.initState();
    displayedCars = mockCars;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Choose Your Ride",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // Drawer icon color
        actions: [
          IconButton(
            onPressed: () {
              // TODO: Open notifications screen or show dialog
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("No new notifications")),
              );
            },
            icon: const Icon(Icons.notifications, color: Colors.white),
          ),
          const SizedBox(width: 10), // Spacing at right
        ],
      ),


      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.orange,
              ),
              accountName: const Text("Car Rent", style: TextStyle(fontWeight: FontWeight.bold)),
              accountEmail: const Text("carrent@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "C",
                  style: TextStyle(fontSize: 24, color: Colors.orange, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.orange),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context); // Close drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.orange),
              title: const Text("Booking History"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HistoryScreen()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.orange),
              title: const Text("Logout"),
              onTap: () async {
                Navigator.pop(context);


                final prefs = await SharedPreferences.getInstance();
                await prefs.clear();


                final bookingProvider = Provider.of<BookingProvider>(context, listen: false);
                bookingProvider.selectedCar = null;
                bookingProvider.userName = '';
                bookingProvider.pickupDate = '';
                bookingProvider.location = '';
                bookingProvider.bookingHistory.clear();


                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) =>  LoginScreen()),
                      (route) => false,
                );
              },
            ),

          ],
        ),
      ),
      body: Column(
        children: [
          // Welcome banner
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Text(
              "Find the best car for your trip",
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              itemCount: displayedCars.length,
              itemBuilder: (context, index) {
                final car = displayedCars[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CarDetailScreen(car: car)),
                    ),
                    child: Card(
                      elevation: 4,
                      shadowColor: Colors.orange.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            // Car Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                car.image,
                                width: 100,
                                height: 70,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.directions_car,
                                    size: 50, color: Colors.grey),
                              ),
                            ),
                            const SizedBox(width: 15),

                            // Car Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${car.brand} ${car.model}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    "${car.transmission} • ${car.fuel}",
                                    style: TextStyle(
                                        color: Colors.grey[600], fontSize: 13),
                                  ),
                                ],
                              ),
                            ),

                            // Price & Arrow
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "\$${car.pricePerDay}",
                                  style: const TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                const Text("/day",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey)),
                                const Icon(Icons.arrow_forward_ios,
                                    size: 14, color: Colors.orange),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
