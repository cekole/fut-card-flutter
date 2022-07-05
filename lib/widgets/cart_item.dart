import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  const CartItem({
    super.key,
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(160, 255, 235, 59),
            Color.fromARGB(255, 127, 169, 190)
          ],
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Chip(
          avatar: CircleAvatar(),
          label: Text('Hello'),
        ),
      ),
    );
  }
}
