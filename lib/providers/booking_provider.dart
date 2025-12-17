import 'package:flutter/material.dart';
import '../models/car_model.dart';

class BookingProvider with ChangeNotifier {
  Car? selectedCar;
  String userName = '';
  String pickupDate = '';
  String location = '';


  final List<Map<String, dynamic>> _bookingHistory = [];

  List<Map<String, dynamic>> get bookingHistory => _bookingHistory;

  void setBookingDetails(Car car, String name, String date, String loc) {
    selectedCar = car;
    userName = name;
    pickupDate = date;
    location = loc;

    _bookingHistory.add({
      'car': car,
      'userName': name,
      'pickupDate': date,
      'location': loc,
    });

    notifyListeners();
  }
}
