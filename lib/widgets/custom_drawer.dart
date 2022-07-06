import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/screens/cart_screen.dart';
import 'package:fut_card/screens/orders_screen.dart';
import 'package:fut_card/screens/players_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        backgroundColor: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            AppBar(
              leading: SizedBox(),
              title: Text('Fut Card'),
              backgroundColor: Theme.of(context).dividerColor,
            ),
            Expanded(
              child: ListView(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Icon(
                            Icons.home,
                            color: Color(0xff4de6eb),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1),
                        Text(
                          'Home Screen',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Anton',
                            color: Color(0xff4de6eb),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(0xff4de6eb),
                    thickness: 1,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(CartScreen.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Icon(
                            Icons.payment_outlined,
                            color: Color(0xff4de6eb),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1),
                        Text(
                          'Cart',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Anton',
                            color: Color(0xff4de6eb),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(0xff4de6eb),
                    thickness: 1,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(OrdersScreen.routeName);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Icon(
                            Icons.card_travel_rounded,
                            color: Color(0xff4de6eb),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.1),
                        Text(
                          'Orders',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Anton',
                            color: Color(0xff4de6eb),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
