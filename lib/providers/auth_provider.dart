import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;


  Future<bool> login(String email, String password) async {

    if (email.isNotEmpty && password.length > 5) {
      _isLoggedIn = true;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}