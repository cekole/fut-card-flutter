import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/widgets/cart_item.dart';
import 'package:fut_card/widgets/custom_drawer.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(routeName.characters.skip(1).string.toUpperCase()),
      ),
      body: ListView.separated(
        separatorBuilder: ((context, index) => Divider()),
        itemBuilder: (context, index) {
          return CartItem(
            id: 'p1',
            price: 0,
            quantity: 2,
            title: 'test',
            productId: 'player1',
          );
        },
        itemCount: 10,
      ),
    );
  }
}
