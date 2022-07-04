import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/screens/settings_screen.dart';
import 'package:fut_card/widgets/pages_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var coins = 50000;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(SettingsScreen.routeName);
          },
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Home Screen',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 8.0, top: 4.0),
            color: Colors.black38,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '$coins',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Icon(
                  Icons.attach_money,
                  color: Colors.green,
                )
              ],
            ),
          ),
          Expanded(
            child: PagesGrid(),
          ),
        ],
      ),
    );
  }
}
