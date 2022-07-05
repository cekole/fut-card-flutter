import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/widgets/balance_container.dart';
import 'package:fut_card/widgets/custom_drawer.dart';
import 'package:fut_card/widgets/pages_grid.dart';
import 'package:fut_card/user_info.dart' as globals;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'Home Screen',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          BalanceContainer(balance: globals.balance),
          Expanded(
            child: PagesGrid(),
          ),
        ],
      ),
    );
  }
}
