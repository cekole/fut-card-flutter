import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fut_card/providers/players.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'team.dart';

class Teams with ChangeNotifier {
  List<Team> _teams = [
    /* Team(
      id: 't1',
      teamName: 'Fenerbahçe',
      foundationYear: 1907,
      imageUrl: 'https://cdn.futbin.com/content/fifa22/img/clubs/326.png',
    ) */
  ];

  List<Team> get teams {
    return [..._teams];
  }

  Team findById(String id) {
    return _teams.firstWhere((element) => element.id == id);
  }

  Team findByTeamName(String teamName) {
    return _teams.firstWhere((element) => element.teamName == teamName);
  }

  Future<void> addTeam(Team team) async {
    final url = Uri.parse(
        'https://fut-cards-fe749-default-rtdb.firebaseio.com/teams.json');

    final response = await http.post(
      url,
      body: json.encode(
        {
          'teamName': team.teamName,
          'foundationYear': team.foundationYear,
          'imageUrl': (team.imageUrl!).substring(team.imageUrl!.length - 3) ==
                  'png'
              ? team.imageUrl
              : 'https://cdn.futbin.com/content/fifa22/img/clubs/114605.png',
        },
      ),
    );
    final newTeam = Team(
      id: json.decode(response.body)['name'],
      teamName: team.teamName,
      foundationYear: team.foundationYear,
      imageUrl: team.imageUrl,
    );
    _teams.add(newTeam);
    notifyListeners();
  }

  Future<void> fetchTeams() async {
    final url = Uri.parse(
        'https://fut-cards-fe749-default-rtdb.firebaseio.com/teams.json');
    final response = await http.get(url);
    final List<Team> fetchedTeamsList = [];
    final responseBody = json.decode(response.body) as Map<String, dynamic>;
    responseBody.forEach(
      (teamId, teamData) {
        fetchedTeamsList.add(
          Team(
            id: teamId,
            teamName: teamData['teamName'],
            foundationYear: teamData['foundationYear'],
            imageUrl: teamData['imageUrl'],
          ),
        );
      },
    );
    _teams = fetchedTeamsList;
    notifyListeners();
  }

  Future<void> updateTeam(String id, Team team) async {
    final teamIndex = _teams.indexWhere(
      (element) => element.id == id,
    );
    if (teamIndex >= 0) {
      final url = Uri.parse(
          'https://fut-cards-fe749-default-rtdb.firebaseio.com/teams/$id.json');
      final response = await http.patch(
        url,
        body: json.encode(
          {
            'teamName': team.teamName,
            'foundationYear': team.foundationYear,
            'imageUrl': team.imageUrl,
          },
        ),
      );
      _teams[teamIndex] = team;
      notifyListeners();
    }
  }

  Future<void> deleteTeam(String id) async {
    final url = Uri.parse(
        'https://fut-cards-fe749-default-rtdb.firebaseio.com/teams/$id.json');
    Team? team = _teams.firstWhere((element) => element.id == id);
    final response = await http.delete(url);

    _teams.remove(team);
    notifyListeners();
    team = null;
  }
}
