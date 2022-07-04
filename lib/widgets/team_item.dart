import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/screens/edit_teams_screen.dart';
import 'package:fut_card/screens/players_screen.dart';

class TeamItem extends StatelessWidget {
  final String? id;
  final String? teamName;
  final int? foundationYear;
  final String? imageUrl;

  const TeamItem({
    super.key,
    required this.id,
    required this.teamName,
    required this.imageUrl,
    required this.foundationYear,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(PlayersScreen.routeName, arguments: teamName);
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(160, 255, 235, 59),
              Color.fromARGB(255, 127, 169, 190)
            ],
          ),
        ),
        child: ListTile(
          title: Text(teamName!),
          subtitle: Text('Foundation Year: $foundationYear'),
          leading: Image.network(imageUrl!),
          trailing: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(EditTeamsScreen.routeName, arguments: id);
            },
            icon: Icon(Icons.edit),
          ),
        ),
      ),
    );
  }
}
