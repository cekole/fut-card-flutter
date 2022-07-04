import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/screens/cards_screen.dart';
import 'package:fut_card/screens/edit_player_screen.dart';

class PlayerItem extends StatelessWidget {
  final String? id;
  final String? name;
  final int? age;
  final int? pace;
  final int? shooting;
  final int? passing;
  final int? dribbling;
  final int? defending;
  final int? physical;
  final String? nationality;
  final String? team;
  final String? imageUrl;

  const PlayerItem({
    super.key,
    required this.id,
    required this.name,
    required this.age,
    required this.nationality,
    required this.imageUrl,
    required this.team,
    required this.pace,
    required this.shooting,
    required this.passing,
    required this.dribbling,
    required this.defending,
    required this.physical,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CardsScreen.routeName, arguments: id);
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
          title: Text(name!),
          subtitle: Text('Age: $age  Nationality: $nationality \nTeam: $team'),
          leading: Image.network(imageUrl!),
          trailing: (ModalRoute.of(context)!.settings.arguments != null)
              ? SizedBox()
              : IconButton(
                  icon: Icon(
                    Icons.edit,
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(EditPlayerScreen.routeName, arguments: id);
                  },
                ),
        ),
      ),
    );
  }
}
