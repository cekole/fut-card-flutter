import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(routeName.characters.skip(1).string.toUpperCase())),
    );
  }
}
