import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:fut_card/providers/teams.dart';
import 'package:fut_card/screens/edit_teams_screen.dart';
import 'package:fut_card/widgets/team_item.dart';
import 'package:provider/provider.dart';

class TeamsScreen extends StatefulWidget {
  static const routeName = '/teams';
  const TeamsScreen({super.key});

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
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
      Provider.of<Teams>(context).fetchTeams().then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    final teamData = Provider.of<Teams>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
              TeamsScreen.routeName.characters.skip(1).string.toUpperCase())),
      body: RefreshIndicator(
        onRefresh: () {
          return Provider.of<Teams>(context, listen: false).fetchTeams();
        },
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.yellow,
                ),
              )
            : ListView.builder(
                itemBuilder: ((context, index) {
                  return TeamItem(
                    id: teamData.teams[index].id,
                    teamName: teamData.teams[index].teamName,
                    imageUrl: teamData.teams[index].imageUrl,
                    foundationYear: teamData.teams[index].foundationYear,
                  );
                }),
                itemCount: teamData.teams.length,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(EditTeamsScreen.routeName);
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}
