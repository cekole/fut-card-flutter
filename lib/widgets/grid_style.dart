import 'package:flutter/material.dart';

class GridStyle extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String routeName;

  const GridStyle({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.routeName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(routeName),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Color(0xff262c38),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Color(0xff4de6eb),
                  fontSize: 18,
                  fontStyle: FontStyle.italic),
            ),
            Image.network(imageUrl),
          ],
        ),
      ),
    );
  }
}
