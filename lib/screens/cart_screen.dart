import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/providers/cart.dart';
import 'package:fut_card/widgets/balance_container.dart';
import 'package:fut_card/widgets/cart_item.dart';
import 'package:fut_card/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var balance = 50000;
    final cartData = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(routeName.characters.skip(1).string.toUpperCase()),
      ),
      body: Column(
        children: [
          BalanceContainer(balance: balance),
          Expanded(
            child: ListView.separated(
              separatorBuilder: ((context, index) => Divider()),
              itemBuilder: (context, index) {
                return CartItem(
                  id: 'p1',
                  price: 0,
                  quantity: 2,
                  title: 'test',
                  playerId: 'player1',
                );
              },
              itemCount: 2,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Order Now'),
          ),
        ],
      ),
    );
  }
}
