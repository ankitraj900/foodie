import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _cartItems = [];
  double _walletBalance = 5000.0;

  List<Map<String, dynamic>> get cartItems => _cartItems;
  double get walletBalance => _walletBalance;
  int get totalAmount => _cartItems.fold<int>(
        0,
        (sum, item) => sum + ((item['price'] as int) * (item['quantity'] as int)),
      );

  void addToCart(Map<String, dynamic> item) {
    // Check if item already exists in cart
    final existingItemIndex = _cartItems.indexWhere(
      (cartItem) => cartItem['name'] == item['name'],
    );

    if (existingItemIndex != -1) {
      // If item exists, increase quantity
      _cartItems[existingItemIndex]['quantity'] += 1;
    } else {
      // If item doesn't exist, add it with quantity 1
      _cartItems.add({
        ...item,
        'quantity': 1,
      });
    }
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void updateQuantity(int index, int newQuantity) {
    if (newQuantity > 0) {
      _cartItems[index]['quantity'] = newQuantity;
    } else {
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void updateWalletBalance(double amount) {
    _walletBalance = amount;
    notifyListeners();
  }

  bool placeOrder() {
    if (_walletBalance >= totalAmount) {
      _walletBalance -= totalAmount;
      clearCart();
      notifyListeners();
      return true;
    }
    return false;
  }
} 