import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/providers/players.dart';
import 'package:fut_card/widgets/card_item.dart';
import 'package:fut_card/widgets/individual_card_item.dart';
import 'package:provider/provider.dart';

class CardsScreen extends StatefulWidget {
  static const routeName = '/cards';
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
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
    final playerData = Provider.of<Players>(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
              CardsScreen.routeName.characters.skip(1).string.toUpperCase())),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colors.yellow,
              ),
            )
          : ModalRoute.of(context)!.settings.arguments != null
              ? IndividualCardItem(
                  name: playerData
                      .findById(
                          ModalRoute.of(context)!.settings.arguments.toString())
                      .name,
                  overall: playerData
                      .findById(
                          ModalRoute.of(context)!.settings.arguments.toString())
                      .overall,
                  pace: playerData
                      .findById(
                          ModalRoute.of(context)!.settings.arguments.toString())
                      .pace,
                  shooting: playerData
                      .findById(
                          ModalRoute.of(context)!.settings.arguments.toString())
                      .shooting,
                  passing: playerData
                      .findById(
                          ModalRoute.of(context)!.settings.arguments.toString())
                      .passing,
                  dribbling: playerData
                      .findById(
                          ModalRoute.of(context)!.settings.arguments.toString())
                      .dribbling,
                  defending: playerData
                      .findById(
                          ModalRoute.of(context)!.settings.arguments.toString())
                      .defending,
                  physical: playerData
                      .findById(
                          ModalRoute.of(context)!.settings.arguments.toString())
                      .physical,
                  imageUrl: playerData
                      .findById(
                          ModalRoute.of(context)!.settings.arguments.toString())
                      .imageUrl,
                  clubImageUrl: playerData
                      .findById(
                          ModalRoute.of(context)!.settings.arguments.toString())
                      .clubImageUrl)
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    mainAxisSpacing: MediaQuery.of(context).size.height * 0.03,
                    crossAxisSpacing: MediaQuery.of(context).size.width * 0.05,
                  ),
                  itemBuilder: ((context, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(CardsScreen.routeName,
                              arguments: playerData.players[index].id);
                        },
                        child: CardItem(
                          name: playerData.players[index].name,
                          overall: playerData.players[index].overall,
                          imageUrl: playerData.players[index].imageUrl,
                          clubImageUrl: playerData.players[index].clubImageUrl,
                          pace: playerData.players[index].pace,
                          shooting: playerData.players[index].shooting,
                          passing: playerData.players[index].passing,
                          dribbling: playerData.players[index].dribbling,
                          defending: playerData.players[index].defending,
                          physical: playerData.players[index].physical,
                        ),
                      )),
                  itemCount: playerData.players.length,
                ),
    );
  }
}
