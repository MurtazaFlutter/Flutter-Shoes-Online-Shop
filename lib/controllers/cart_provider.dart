import 'package:flutter/material.dart';
import 'package:online_shop/models/cart/get_products.dart';

class CartNotifier extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increament() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    if (counter >= 1) {
      _counter--;
    }
    notifyListeners();
  }

  int? _productIndex;

  int get productIndex => _productIndex ?? 0;

  set setProductIndex(int newState) {
    _productIndex = newState;
    notifyListeners();
  }

  List<Product> _checkout = [];

  List<Product> get checkout => _checkout;

  set setCheckoutList(List<Product> newState) {
    _checkout = newState;
    notifyListeners();
  }
}
