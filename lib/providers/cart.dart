import 'package:flutter/material.dart';

class CartItemPr {
  final String? id;
  final String? title;
  final int? quantity;
  final double? price;

  CartItemPr({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItemPr> _items = {};

  Map<String, CartItemPr> get items {
    return {..._items};
  }
}
