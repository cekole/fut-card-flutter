import 'package:flutter/material.dart';

class Player with ChangeNotifier {
  final String? id;
  final String? name;
  final int? age;
  final int? pace;
  final int? shooting;
  final int? passing;
  final int? dribbling;
  final int? defending;
  final int? physical;
  final int? overall;
  final int? price;
  final String? nationality;
  final String? team;
  final String? imageUrl;
  final String? clubImageUrl;

  Player({
    required this.overall,
    required this.id,
    required this.name,
    required this.age,
    required this.pace,
    required this.shooting,
    required this.passing,
    required this.dribbling,
    required this.defending,
    required this.physical,
    required this.nationality,
    required this.imageUrl,
    required this.clubImageUrl,
    required this.team,
    required this.price,
  });
}
