import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:fut_card/screens/cards_screen.dart';
import 'package:fut_card/screens/players_screen.dart';
import 'package:fut_card/screens/teams_screen.dart';

import 'grid_style.dart';

class PagesGrid extends StatelessWidget {
  const PagesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 25,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1.2,
        mainAxisSpacing: MediaQuery.of(context).size.height * 0.03,
        crossAxisSpacing: MediaQuery.of(context).size.width * 0.03,
      ),
      children: const [
        GridStyle(
          title: 'PLAYERS',
          imageUrl:
              'https://cdn.futbin.com/content/fifa22/img/players/p100894973.png',
          routeName: PlayersScreen.routeName,
        ),
        GridStyle(
          title: 'TEAMS',
          imageUrl:
              'https://cdn.futbin.com/content/fifa22/img/clubs/114605.png',
          routeName: TeamsScreen.routeName,
        ),
        GridStyle(
          title: 'CARDS',
          imageUrl: 'https://static.wefut.com/assets/images/fut22/gold1.png',
          routeName: CardsScreen.routeName,
        ),
      ],
    );
  }
}
