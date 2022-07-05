import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fut_card/providers/player.dart';
import 'package:http/http.dart' as http;

class Players with ChangeNotifier {
  List<Player> _players = [
    /* Player(
        id: 'p1',
        name: 'Marcus Rashford',
        age: 24,
        nationality: 'England',
        imageUrl:
            'https://futhead.cursecdn.com/static/img/21/players_alt/p67340541.png'), */
  ];

  List<Player> get players {
    return [..._players];
  }

  set setPlayers(List<Player> players) {
    _players = players;
  }

  Player findById(String id) {
    return _players.firstWhere((element) => element.id == id);
  }

  List<Player> findByTeam(String teamName) {
    return _players.where((element) => element.team == teamName).toList();
  }

  Future<void> addPlayer(Player player) async {
    final url = Uri.parse(
        'https://fut-cards-fe749-default-rtdb.firebaseio.com/players.json');

    final response = await http.post(
      url,
      body: json.encode(
        {
          'name': player.name,
          'nationality': player.nationality,
          'imageUrl': (player.imageUrl!)
                      .substring(player.imageUrl!.length - 3) ==
                  'png'
              ? player.imageUrl
              : 'https://www.fifacm.com/content/media/imgs/fifa22/players/notfound_player.png',
          'clubImageUrl': (player.clubImageUrl!)
                      .substring(player.clubImageUrl!.length - 3) ==
                  'png'
              ? player.clubImageUrl
              : 'https://cdn.futbin.com/content/fifa22/img/clubs/114605.png',
          'team': player.team,
          'age': player.age,
          'pace': player.pace,
          'shooting': player.shooting,
          'passing': player.passing,
          'dribbling': player.dribbling,
          'defending': player.defending,
          'physical': player.physical,
          'overall': player.overall,
        },
      ),
    );
    final newPlayer = Player(
      id: json.decode(response.body)['name'],
      name: player.name,
      age: player.age,
      pace: player.pace,
      shooting: player.shooting,
      passing: player.passing,
      dribbling: player.dribbling,
      defending: player.defending,
      physical: player.physical,
      overall: player.overall,
      nationality: player.nationality,
      team: player.team,
      imageUrl: player.imageUrl,
      clubImageUrl: player.clubImageUrl,
    );

    _players.add(newPlayer);
    notifyListeners();
  }

  Future<void> updatePlayer(String id, Player player) async {
    final playerIndex = _players.indexWhere(
      (element) => element.id == id,
    );
    if (playerIndex >= 0) {
      final url = Uri.parse(
          'https://fut-cards-fe749-default-rtdb.firebaseio.com/players/$id.json');
      final response = await http.patch(
        url,
        body: json.encode(
          {
            'name': player.name,
            'nationality': player.nationality,
            'imageUrl': (player.imageUrl!)
                        .substring(player.imageUrl!.length - 3) ==
                    'png'
                ? player.imageUrl
                : 'https://www.fifacm.com/content/media/imgs/fifa22/players/notfound_player.png',
            'clubImageUrl': (player.clubImageUrl!)
                        .substring(player.clubImageUrl!.length - 3) ==
                    'png'
                ? player.clubImageUrl
                : 'https://cdn.futbin.com/content/fifa22/img/clubs/114605.png',
            'team': player.team,
            'age': player.age,
            'pace': player.pace,
            'shooting': player.shooting,
            'passing': player.passing,
            'dribbling': player.dribbling,
            'defending': player.defending,
            'physical': player.physical,
            'overall': player.overall,
          },
        ),
      );
      _players[playerIndex] = player;
      notifyListeners();
    }
  }

  Future<void> fetchPlayers() async {
    final url = Uri.parse(
        'https://fut-cards-fe749-default-rtdb.firebaseio.com/players.json');
    final response = await http.get(url);
    final List<Player> fetchedPlayersList = [];
    final responseBody = json.decode(response.body) as Map<String, dynamic>;
    responseBody.forEach(
      (playerId, playerData) {
        fetchedPlayersList.add(
          Player(
            id: playerId,
            name: playerData['name'],
            age: playerData['age'],
            pace: playerData['pace'],
            shooting: playerData['shooting'],
            passing: playerData['passing'],
            dribbling: playerData['dribbling'],
            defending: playerData['defending'],
            physical: playerData['physical'],
            overall: playerData['overall'],
            nationality: playerData['nationality'],
            team: playerData['team'],
            imageUrl: playerData['imageUrl'],
            clubImageUrl: playerData['clubImageUrl'],
          ),
        );
      },
    );
    _players = fetchedPlayersList;
    notifyListeners();
  }

  Future<void> deletePlayer(String id) async {
    final url = Uri.parse(
        'https://fut-cards-fe749-default-rtdb.firebaseio.com/players/$id.json');
    Player? player = _players.firstWhere((element) => element.id == id);
    final response = await http.delete(url);

    _players.remove(player);
    notifyListeners();
    player = null;
  }
}
