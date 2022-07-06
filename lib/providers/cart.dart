import 'package:flutter/material.dart';

class CartItemPr {
  final String? id;
  final String? title;
  final int? quantity;
  final int? price;
  final String? imageUrl;

  CartItemPr({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItemPr> _items = {};

  Map<String, CartItemPr> get items {
    return {..._items};
  }

  Future<void> addItem(
      String playerId, int price, String title, String imageUrl) async {
    if (_items.containsKey(playerId)) {
      _items.update(
          playerId,
          (existingCartItem) => CartItemPr(
                id: existingCartItem.id,
                title: existingCartItem.title,
                quantity: existingCartItem.quantity! + 1,
                price: existingCartItem.price,
                imageUrl: existingCartItem.imageUrl,
              ));
    } else {
      _items.putIfAbsent(
          playerId,
          () => CartItemPr(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              imageUrl: imageUrl,
              price: price));
    }
    notifyListeners();
  }
}
