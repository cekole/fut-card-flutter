import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/providers/players.dart';
import 'package:fut_card/screens/edit_player_screen.dart';
import 'package:fut_card/widgets/player_item.dart';
import 'package:provider/provider.dart';

class PlayersScreen extends StatefulWidget {
  static const routeName = '/players';
  const PlayersScreen({super.key});

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _isLoading = true;
      Provider.of<Players>(context).fetchPlayers().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    var playerData = Provider.of<Players>(context);
    if (ModalRoute.of(context)!.settings.arguments != null) {
      final teamName = ModalRoute.of(context)!.settings.arguments as String;
      final teamPlayers = Provider.of<Players>(context).findByTeam(teamName);
      playerData.setPlayers = teamPlayers;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
            PlayersScreen.routeName.characters.skip(1).string.toUpperCase()),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Provider.of<Players>(context, listen: false).fetchPlayers();
        },
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.yellow,
                ),
              )
            : ListView.builder(
                itemBuilder: ((context, index) {
                  return PlayerItem(
                    id: playerData.players[index].id,
                    name: playerData.players[index].name,
                    age: playerData.players[index].age,
                    pace: playerData.players[index].pace,
                    shooting: playerData.players[index].shooting,
                    passing: playerData.players[index].passing,
                    dribbling: playerData.players[index].dribbling,
                    defending: playerData.players[index].defending,
                    physical: playerData.players[index].physical,
                    nationality: playerData.players[index].nationality,
                    team: playerData.players[index].team,
                    imageUrl: playerData.players[index].imageUrl,
                  );
                }),
                itemCount: playerData.players.length,
              ),
      ),
      floatingActionButton: ModalRoute.of(context)!.settings.arguments != null
          ? SizedBox()
          : FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditPlayerScreen.routeName);
              },
              child: Icon(Icons.add),
              backgroundColor: Theme.of(context).backgroundColor,
            ),
    );
  }
}
