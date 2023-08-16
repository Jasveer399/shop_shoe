import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class CartNotifier extends ChangeNotifier {
  final _cartbox = Hive.box('cart_box');
  int _counter = 0;
  List<dynamic> _cart = [];

  int get counter => _counter;

  List<dynamic> get cart=>_cart;

  set cart(List<dynamic> newcart){
    _cart=newcart;
    notifyListeners();
  }

  getcart() {
    final cartdata = _cartbox.keys.map((key) {
      final item = _cartbox.get(key);
      return {
        "key": key,
        "id": item["id"],
        "category": item["category"],
        "name": item["name"],
        "imageurl": item["imageurl"],
        "price": item["price"],
        "sizes": item["sizes"],
        "qty": item["qty"],
      };
    }).toList();
    _cart = cartdata.reversed.toList();
  }

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    if (_counter >= 1) {
      _counter--;
      notifyListeners();
    }
  }

  Future<void> deletecart(int key)async {
    _cartbox.delete(key);
  }
}
