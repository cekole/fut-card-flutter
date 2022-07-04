import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/providers/players.dart';
import 'package:provider/provider.dart';

class IndividualCardItem extends StatelessWidget {
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

  const IndividualCardItem({
    super.key,
    required this.name,
    required this.overall,
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
    return Stack(
      children: [
        overall! >= 75
            ? Image.network(
                'https://cdn.shopify.com/s/files/1/0276/5635/5926/products/GOLD_51bae328-70fd-4488-8639-f4e0e697444d_1024x1024.png')
            : overall! > 65
                ? Image.network(
                    'https://cdn.shopify.com/s/files/1/0276/5635/5926/products/SILVER_1024x1024.png')
                : Image.network(
                    'https://pdf-service-static.s3.amazonaws.com/static/layout-images/cardstar/thumbnails/bronze.png'),
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
            left: devSize.width * 0.26,
            top: devSize.height * 0.29,
            child: Image.network(
              clubImageUrl!,
              scale: 3.5,
            )),
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
          height: devSize.height * 0.2,
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
      ],
    );
  }
}
