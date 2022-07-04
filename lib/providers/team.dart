import 'package:flutter/material.dart';

class Team with ChangeNotifier {
  final String? id;
  final String? teamName;
  final int? foundationYear;
  final String? imageUrl;

  Team({
    required this.id,
    required this.teamName,
    required this.foundationYear,
    required this.imageUrl,
  });
}
