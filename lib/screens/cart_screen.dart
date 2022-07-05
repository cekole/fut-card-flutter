import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/providers/cart.dart';
import 'package:fut_card/widgets/balance_container.dart';
import 'package:fut_card/widgets/cart_item.dart';
import 'package:fut_card/widgets/custom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:fut_card/user_info.dart' as globals;

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title:
            Text(CartScreen.routeName.characters.skip(1).string.toUpperCase()),
      ),
      body: Column(
        children: [
          BalanceContainer(balance: globals.balance),
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
            onPressed: () {
              setState(() {
                globals.balance -= 5000;
              });
            },
            child: Text('Order Now'),
          ),
        ],
      ),
    );
  }
}
