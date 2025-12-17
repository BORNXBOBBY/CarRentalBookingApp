import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/car_model.dart';
import '../providers/booking_provider.dart';
import 'booking_confirmation_screen.dart';


class CarDetailScreen extends StatefulWidget {
  final Car car;
  const CarDetailScreen({Key? key, required this.car}) : super(key: key);

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dateController = TextEditingController();
  final _locationController = TextEditingController(text: "Downtown Center");

  @override
  void dispose() {
    _nameController.dispose();
    _dateController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.orange),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("${widget.car.brand} Details"),
        backgroundColor: Colors.orange,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white), // Back arrow color
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Car Image with Shadow
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    widget.car.image,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.directions_car, size: 100, color: Colors.grey),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Car Info Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "${widget.car.brand} ${widget.car.model}",
                            style: const TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "\$${widget.car.pricePerDay}/day",
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Specs: ${widget.car.transmission} | ${widget.car.fuel}",
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                    const Divider(height: 40, thickness: 1.2),

                    const Text("Booking Information",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15),

                    // Name Field
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        prefixIcon:
                        const Icon(Icons.person, color: Colors.orange),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) =>
                      value!.isEmpty ? "Please enter your name" : null,
                    ),
                    const SizedBox(height: 15),

                    // Date Field
                    TextFormField(
                      controller: _dateController,
                      readOnly: true,
                      onTap: () => _selectDate(context),
                      decoration: InputDecoration(
                        labelText: "Pick-up Date",
                        prefixIcon:
                        const Icon(Icons.calendar_today, color: Colors.orange),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) =>
                      value!.isEmpty ? "Select a date" : null,
                    ),
                    const SizedBox(height: 15),

                    // Location Field
                    TextFormField(
                      controller: _locationController,
                      decoration: InputDecoration(
                        labelText: "Pick-up Location",
                        prefixIcon:
                        const Icon(Icons.location_on, color: Colors.orange),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Confirm Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 4,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<BookingProvider>().setBookingDetails(
                              widget.car,
                              _nameController.text,
                              _dateController.text,
                              _locationController.text,
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ConfirmationScreen()),
                            );
                          }
                        },
                        child: const Text(
                          "CONFIRM BOOKING",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
