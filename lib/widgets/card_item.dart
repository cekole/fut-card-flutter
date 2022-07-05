import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/providers/players.dart';
import 'package:provider/provider.dart';

class CardItem extends StatelessWidget {
  final String? name;
  final int? overall;
  final int? pace;
  final int? shooting;
  final int? passing;
  final int? dribbling;
  final int? defending;
  final int? physical;
  final String? imageUrl;
  final String? clubImageUrl;

  const CardItem({
    super.key,
    required this.name,
    required this.overall,
    required this.imageUrl,
    required this.pace,
    required this.shooting,
    required this.passing,
    required this.dribbling,
    required this.defending,
    required this.physical,
    required this.clubImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final devSize = MediaQuery.of(context).size;
    var splittedName = name!.split(' ');
    return Stack(
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
          left: devSize.width * 0.09,
          top: devSize.height * 0.07,
          child: Text(
            overall.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        Positioned(
          left: splittedName[splittedName.length - 1].characters.length <= 5
              ? devSize.width * 0.16
              : devSize.width * 0.15,
          top: devSize.height * 0.16,
          child: Text(
            splittedName[splittedName.length - 1].characters.length >= 5
                ? splittedName[splittedName.length - 1]
                : name!,
            style: TextStyle(fontSize: 18),
          ),
        ),
        Positioned(
          height: devSize.height * 0.1,
          left: devSize.width * 0.13,
          top: devSize.height * 0.06,
          child: Image.network(
            imageUrl!,
            scale: 0.5,
          ),
        ),
      ],
    );
  }
}
