import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/providers/players.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final int price;
  final int quantity;
  final String title;
  final String? imageUrl;

  const CartItem({
    super.key,
    required this.id,
    required this.price,
    required this.quantity,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(160, 255, 235, 59),
            Color.fromARGB(255, 127, 169, 190),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
            color: Color.fromARGB(104, 127, 169, 190),
            child: Column(
              children: [
                Text(
                  'Value: $price \$',
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            children: [
              Image.network(
                imageUrl!,
                scale: 2,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(3),
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
