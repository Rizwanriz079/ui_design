import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String image;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(CartItem item) {
    var existingItem = _cartItems.firstWhere(
          (cartItem) => cartItem.name == item.name,
      orElse: () => CartItem(name: '', image: '', price: 0),
    );

    if (existingItem.name != '') {
      existingItem.quantity += item.quantity; // If exists, update quantity
    } else {
      _cartItems.add(item); // If not, add to cart
    }
    notifyListeners();
  }

  void updateQuantity(CartItem item, int newQuantity) {
    item.quantity = newQuantity;
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(
      0.0,
          (sum, item) => sum + item.price * item.quantity,
    );
  }
}
