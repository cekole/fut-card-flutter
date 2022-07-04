import 'package:flutter/material.dart';
import 'package:fut_card/providers/players.dart';
import 'package:fut_card/providers/teams.dart';
import 'package:fut_card/screens/cards_screen.dart';
import 'package:fut_card/screens/edit_player_screen.dart';
import 'package:fut_card/screens/edit_teams_screen.dart';
import 'package:fut_card/screens/home_screen.dart';
import 'package:fut_card/screens/players_screen.dart';
import 'package:fut_card/screens/settings_screen.dart';
import 'package:fut_card/screens/teams_screen.dart';
import 'package:provider/provider.dart';

import 'providers/player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Players(),
        ),
        ChangeNotifierProvider(
          create: (_) => Teams(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color(0xff121319),
          backgroundColor: Color(0xff32353b),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          PlayersScreen.routeName: (context) => PlayersScreen(),
          CardsScreen.routeName: (context) => CardsScreen(),
          TeamsScreen.routeName: (context) => TeamsScreen(),
          SettingsScreen.routeName: (context) => SettingsScreen(),
          EditPlayerScreen.routeName: (context) => EditPlayerScreen(),
          EditTeamsScreen.routeName: (context) => EditTeamsScreen(),
        },
      ),
    );
  }
}
