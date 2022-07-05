import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/providers/players.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String playerId;
  final double price;
  final int quantity;
  final String title;

  const CartItem({
    super.key,
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
    required this.playerId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(160, 255, 235, 59),
            Color.fromARGB(255, 127, 169, 190)
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Chip(
              backgroundColor: Color.fromARGB(96, 190, 150, 150),
              avatar: CircleAvatar(
                backgroundColor: Theme.of(context).backgroundColor,
                child: FittedBox(child: Text(price.toStringAsFixed(2))),
              ),
              label: Text(
                playerId,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Spacer(),
          Column(
            children: [
              Image.network(
                'https://cdn.futbin.com/content/fifa22/img/players/237067.png',
                scale: 2,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).backgroundColor),
            child: Text(
              'x $quantity',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
