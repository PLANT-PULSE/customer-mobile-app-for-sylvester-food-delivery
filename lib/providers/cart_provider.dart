import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });

  double get total => price * quantity;
}

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get subtotal => _items.fold(0, (sum, item) => sum + item.total);

  double get deliveryFee => 2.99;

  double get tax => subtotal * 0.08;

  double get total => subtotal + deliveryFee + tax;

  void addItem(String name, double price) {
    final existingItem = _items.firstWhere(
      (item) => item.name == name,
      orElse: () => CartItem(name: '', price: 0),
    );

    if (existingItem.name.isNotEmpty) {
      existingItem.quantity++;
    } else {
      _items.add(CartItem(name: name, price: price));
    }
    notifyListeners();
  }

  void removeItem(String name) {
    _items.removeWhere((item) => item.name == name);
    notifyListeners();
  }

  void updateQuantity(String name, int quantity) {
    final item = _items.firstWhere((item) => item.name == name);
    if (quantity > 0) {
      item.quantity = quantity;
    } else {
      removeItem(name);
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
