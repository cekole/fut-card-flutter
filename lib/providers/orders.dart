import 'package:flutter/material.dart';
import 'package:fut_card/providers/cart.dart';

class OrderItem {
  final String? id;
  final double? amount;
  final List<CartItemPr>? playersOfCart;
  final DateTime? dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.playersOfCart,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItemPr> playersInCart, double total) {
    if (total > 0.0) {
      _orders.insert(
        0,
        OrderItem(
          id: DateTime.now().toString(),
          amount: total,
          playersOfCart: playersInCart,
          dateTime: DateTime.now(),
        ),
      );
      notifyListeners();
    }
  }
}
