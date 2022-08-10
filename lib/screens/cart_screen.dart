import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/providers/cart.dart';
import 'package:fut_card/providers/orders.dart';
import 'package:fut_card/providers/player.dart';
import 'package:fut_card/providers/players.dart';
import 'package:fut_card/screens/orders_screen.dart';
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
    final devSize = MediaQuery.of(context).size;
    final cartData = Provider.of<Cart>(context, listen: false);
    final playerData = Provider.of<Players>(context, listen: false);

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
                  id: cartData.items.values.toList()[index].id!,
                  price: cartData.items.values.toList()[index].price!,
                  quantity: cartData.items.values.toList()[index].quantity!,
                  title: cartData.items.values.toList()[index].title!,
                  imageUrl: cartData.items.values.toList()[index].imageUrl!,
                );
              },
              itemCount: cartData.items.values.length,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: devSize.height * 0.3,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(160, 255, 235, 59),
                    Color.fromARGB(255, 127, 169, 190)
                  ],
                ),
              ),
              child: MaterialButton(
                onPressed: () {
                  final orderData = Provider.of<Orders>(context, listen: false);
                  setState(() {
                    orderData.addOrder(cartData.items.values.toList(), 20);
                    Navigator.of(context)
                        .pushNamed(OrdersScreen.routeName)
                        .then(
                          (value) => globals.balance -= 5000,
                        );
                  });
                },
                child: Text(
                  'Order Now',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
