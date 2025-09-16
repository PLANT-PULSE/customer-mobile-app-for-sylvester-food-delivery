import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../models/order.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  String _userName = '';
  String _userEmail = '';
  String _userPhone = '';
  String _userAddress = '';
  String _password = '';
  List<String> _paymentMethods = [];
  List<String> _addresses = [];
  List<Order> _orders = [];

  bool get isLoggedIn => _isLoggedIn;
  String get userName => _userName;
  String get userEmail => _userEmail;
  String get userPhone => _userPhone;
  String get userAddress => _userAddress;
  List<String> get paymentMethods => _paymentMethods;
  List<String> get addresses => _addresses;
  List<Order> get orders => _orders;

  void login(String email, String password) {
    // TODO: Replace mock with API call to POST /api/auth/login
    // Send email and password in JSON body
    // On success, set user data from response and store JWT token
    // On error, show message

    // Mock login (remove when API is ready)
    if (email.isNotEmpty && password.isNotEmpty) {
      _userEmail = email;
      _userName = email.split('@')[0]; // Extract name from email
      _password = password;
      _isLoggedIn = true;
      notifyListeners();
    }
  }

  void signup(String name, String email, String phone, String password, String address) {
    // TODO: Replace mock with API call to POST /api/auth/signup
    // Send name, email, phone, password, address in JSON body
    // On success, set user data and login
    // On error, show message

    // Mock signup (remove when API is ready)
    if (name.isNotEmpty && email.isNotEmpty && phone.isNotEmpty && password.isNotEmpty) {
      _userName = name;
      _userEmail = email;
      _userPhone = phone;
      _userAddress = address;
      _password = password;
      _isLoggedIn = true;
      notifyListeners();
    }
  }

  void updateProfile(String name, String email, String phone, String address) {
    _userName = name;
    _userEmail = email;
    _userPhone = phone;
    _userAddress = address;
    notifyListeners();
  }

  void resetPassword(String newPassword) {
    _password = newPassword;
    notifyListeners();
  }

  void addPaymentMethod(String method) {
    _paymentMethods.add(method);
    notifyListeners();
  }

  void addAddress(String address) {
    _addresses.add(address);
    notifyListeners();
  }

  void addOrder(Order order) {
    _orders.add(order);
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _userName = '';
    _userEmail = '';
    _userPhone = '';
    _userAddress = '';
    _password = '';
    _paymentMethods.clear();
    _addresses.clear();
    _orders.clear();
    notifyListeners();
  }
}
