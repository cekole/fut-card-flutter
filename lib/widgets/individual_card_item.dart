import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/providers/cart.dart';
import 'package:fut_card/providers/player.dart';
import 'package:fut_card/providers/players.dart';
import 'package:fut_card/screens/cart_screen.dart';
import 'package:provider/provider.dart';

class IndividualCardItem extends StatelessWidget {
  final String? id;
  final String? name;
  final int? overall;
  final int? price;
  final int? pace;
  final int? shooting;
  final int? passing;
  final int? dribbling;
  final int? defending;
  final int? physical;
  final String? imageUrl;
  final String? clubImageUrl;

  const IndividualCardItem({
    super.key,
    required this.id,
    required this.name,
    required this.overall,
    required this.price,
    required this.pace,
    required this.shooting,
    required this.passing,
    required this.dribbling,
    required this.defending,
    required this.physical,
    required this.imageUrl,
    required this.clubImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    var splitted = name!.split(' ');
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          overall! >= 75
              ? Image.network(
                  'https://cdn.shopify.com/s/files/1/0276/5635/5926/products/GOLD_51bae328-70fd-4488-8639-f4e0e697444d_1024x1024.png')
              : overall! > 65
                  ? Image.network(
                      'https://cdn.shopify.com/s/files/1/0276/5635/5926/products/SILVER_1024x1024.png')
                  : Image.network(
                      'https://cdn.shopify.com/s/files/1/0276/5635/5926/products/nrbronze_1024x1024.png?v=1642028876'),
          Positioned(
            left: devSize.width * 0.26,
            top: devSize.height * 0.14,
            child: Text(
              overall.toString(),
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Positioned(
            left: overall! < 65 ? devSize.width * 0.24 : devSize.width * 0.26,
            top: devSize.height * 0.29,
            child: overall! > 65
                ? Image.network(
                    clubImageUrl!,
                    scale: 3.5,
                  )
                : Image.network(
                    clubImageUrl!,
                    scale: 3.8,
                  ),
          ),
          Positioned(
            left: splitted[splitted.length - 1].characters.length <= 5
                ? devSize.width * 0.37
                : devSize.width * 0.36,
            top: devSize.height * 0.365,
            child: Text(
              splitted[splitted.length - 1].characters.length >= 5
                  ? splitted[splitted.length - 1]
                  : name!,
              style: TextStyle(fontSize: 30),
            ),
          ),
          Positioned(
            height:
                overall! < 65 ? devSize.height * 0.19 : devSize.height * 0.2,
            left: devSize.width * 0.32,
            top: devSize.height * 0.16,
            child: Image.network(
              imageUrl!,
              scale: 0.5,
            ),
          ),

          //Attributes => PAC, SHO, PAS, DRI, DEF, PHY
          Positioned(
            left: devSize.width * 0.26,
            top: devSize.height * 0.43,
            child: Row(
              children: [
                Text(
                  pace.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: devSize.width * 0.05,
                ),
                Text(
                  'PAC',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: devSize.width * 0.26,
            top: devSize.height * 0.46,
            child: Row(
              children: [
                Text(
                  shooting.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: devSize.width * 0.05,
                ),
                Text(
                  'SHO',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: devSize.width * 0.26,
            top: devSize.height * 0.49,
            child: Row(
              children: [
                Text(
                  passing.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: devSize.width * 0.05,
                ),
                Text(
                  'PAS',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: devSize.width * 0.55,
            top: devSize.height * 0.43,
            child: Row(
              children: [
                Text(
                  dribbling.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: devSize.width * 0.05,
                ),
                Text(
                  'DRI',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: devSize.width * 0.55,
            top: devSize.height * 0.46,
            child: Row(
              children: [
                Text(
                  defending.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: devSize.width * 0.05,
                ),
                Text(
                  'DEF',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: devSize.width * 0.55,
            top: devSize.height * 0.49,
            child: Row(
              children: [
                Text(
                  physical.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  width: devSize.width * 0.05,
                ),
                Text(
                  'PHY',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: devSize.width * 0.3,
            top: devSize.height * 0.63,
            child: Row(
              children: [
                Icon(
                  Icons.monetization_on_outlined,
                  color: Colors.green,
                  size: 45,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  price.toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: devSize.width * 0.378,
            top: devSize.height * 0.69,
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
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: ((ctx) => AlertDialog(
                          backgroundColor: Color.fromARGB(255, 198, 241, 148),
                          titleTextStyle: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontSize: 20,
                          ),
                          title: Text('Added To Cart'),
                          icon: Icon(
                            Icons.check_circle_rounded,
                            color: Colors.green,
                          ),
                          content: TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.green),
                            ),
                            onPressed: () {
                              customModalPopup(context);
                            },
                            child: Text(
                              'Okay',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .scaffoldBackgroundColor),
                            ),
                          ),
                        )),
                  );
                },
                child: Text(
                  'Add To Cart',
                  style: TextStyle(
                    color: Colors.black87,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void customModalPopup(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);
    final playerData = Provider.of<Players>(context, listen: false);
    showCupertinoModalPopup(
      barrierDismissible: false,
      barrierColor: Color.fromARGB(150, 0, 0, 0),
      context: context,
      builder: ((context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                cartData.addItem(
                  playerData.players.first.team!,
                  playerData.players.first.price!,
                  playerData.players.first.name!,
                  playerData.players.first.imageUrl!,
                );
                Navigator.of(context)
                    .pushNamed(CartScreen.routeName, arguments: id);
              },
              child: Text(
                'Go To Cart',
                style: TextStyle(color: Theme.of(context).backgroundColor),
              ),
            ),
          ],
          cancelButton: CupertinoButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: Text(
              'Close',
              style: TextStyle(
                color: Theme.of(context).errorColor,
                fontSize: 20,
              ),
            ),
          ),
        );
      }),
    );
  }
}
