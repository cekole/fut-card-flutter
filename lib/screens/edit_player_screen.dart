import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/providers/player.dart';
import 'package:fut_card/providers/players.dart';
import 'package:fut_card/providers/team.dart';
import 'package:fut_card/providers/teams.dart';
import 'package:provider/provider.dart';

class EditPlayerScreen extends StatefulWidget {
  static const routeName = '/edit-player';
  const EditPlayerScreen({super.key});

  @override
  State<EditPlayerScreen> createState() => _EditPlayerScreenState();
}

class _EditPlayerScreenState extends State<EditPlayerScreen> {
  final _imageUrlController = TextEditingController();
  final _clubImageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedPlayer = Player(
    id: null,
    name: '',
    age: 0,
    pace: 0,
    shooting: 0,
    passing: 0,
    dribbling: 0,
    defending: 0,
    physical: 0,
    overall: 0,
    nationality: '',
    team: '',
    imageUrl: '',
    clubImageUrl: '',
  );

  var _initValues = {
    'name': '',
    'age': '',
    'pace': '',
    'shooting': '',
    'passing': '',
    'dribbling': '',
    'defending': '',
    'physical': '',
    'overall': '',
    'nationality': '',
    'team': '',
    'imageUrl': '',
    'clubImageUrl': '',
  };

  var _isInit = true;

  void addTeamOfPlayer() {
    final teamsData = Provider.of<Teams>(context, listen: false);
    if (!(teamsData.teams
        .any((element) => element.teamName == _editedPlayer.team))) {
      teamsData.addTeam(
        Team(
          id: DateTime.now().toString(),
          teamName: _editedPlayer.team,
          foundationYear: -1,
          imageUrl: _editedPlayer.clubImageUrl,
        ),
      );
    }
  }

  Future<void> _saveForm() async {
    final isValid = _form.currentState!.validate();

    _form.currentState!.save();

    if (_editedPlayer.id != null) {
      await Provider.of<Players>(context, listen: false)
          .updatePlayer(_editedPlayer.id!, _editedPlayer)
          .then(
            (value) => addTeamOfPlayer(),
          )
          .then((value) =>
              Provider.of<Players>(context, listen: false).fetchPlayers());
    } else {
      await Provider.of<Players>(context, listen: false)
          .addPlayer(_editedPlayer)
          .then((value) {
        addTeamOfPlayer();
      }).then((value) =>
              Provider.of<Players>(context, listen: false).fetchPlayers());
    }

    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        final playerId = ModalRoute.of(context)!.settings.arguments as String;
        _editedPlayer = Provider.of<Players>(context).findById(playerId);

        if (playerId != null) {
          _initValues = {
            'name': _editedPlayer.name!,
            'age': _editedPlayer.age.toString(),
            'pace': _editedPlayer.pace.toString(),
            'shooting': _editedPlayer.shooting.toString(),
            'passing': _editedPlayer.passing.toString(),
            'dribbling': _editedPlayer.dribbling.toString(),
            'defending': _editedPlayer.defending.toString(),
            'physical': _editedPlayer.physical.toString(),
            'overall': _editedPlayer.overall.toString(),
            'nationality': _editedPlayer.nationality!,
            'team': _editedPlayer.team!,
            'imageUrl': '',
            'clubImageUrl': '',
          };
          _imageUrlController.text = _editedPlayer.imageUrl!;
          _clubImageUrlController.text = _editedPlayer.clubImageUrl!;
        }
      }
    }
    _isInit = false;
  }

  @override
  void dispose() {
    super.dispose();
    _imageUrlController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _saveForm();
                });
              },
              icon: Icon(Icons.save))
        ],
        title: ModalRoute.of(context)!.settings.arguments != null
            ? Text('EDIT PLAYER')
            : Text('ADD PLAYER'),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 3, right: 5, left: 5),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 127, 169, 190),
              Color.fromARGB(159, 251, 251, 251),
            ],
          ),
        ),
        child: Form(
          key: _form,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  initialValue: _initValues['name'],
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  textInputAction: TextInputAction.next,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  }),
                  onSaved: (newValue) {
                    _editedPlayer = Player(
                      id: _editedPlayer.id,
                      name: newValue,
                      age: _editedPlayer.age,
                      pace: _editedPlayer.pace,
                      shooting: _editedPlayer.shooting,
                      passing: _editedPlayer.passing,
                      dribbling: _editedPlayer.dribbling,
                      defending: _editedPlayer.defending,
                      physical: _editedPlayer.physical,
                      overall: _editedPlayer.overall,
                      nationality: _editedPlayer.nationality,
                      team: _editedPlayer.team,
                      imageUrl: _editedPlayer.imageUrl,
                      clubImageUrl: _editedPlayer.clubImageUrl,
                    );
                  },
                ),
                TextFormField(
                  initialValue: _initValues['age'],
                  decoration: InputDecoration(
                    labelText: 'Age',
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  }),
                  onSaved: (newValue) {
                    _editedPlayer = Player(
                      id: _editedPlayer.id,
                      name: _editedPlayer.name,
                      age: int.parse(newValue!),
                      pace: _editedPlayer.pace,
                      shooting: _editedPlayer.shooting,
                      passing: _editedPlayer.passing,
                      dribbling: _editedPlayer.dribbling,
                      defending: _editedPlayer.defending,
                      physical: _editedPlayer.physical,
                      overall: _editedPlayer.overall,
                      nationality: _editedPlayer.nationality,
                      team: _editedPlayer.team,
                      imageUrl: _editedPlayer.imageUrl,
                      clubImageUrl: _editedPlayer.clubImageUrl,
                    );
                  },
                ),
                TextFormField(
                  initialValue: _initValues['overall'],
                  decoration: InputDecoration(
                    labelText: 'Overall',
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  }),
                  onSaved: (newValue) {
                    _editedPlayer = Player(
                      id: _editedPlayer.id,
                      name: _editedPlayer.name,
                      age: _editedPlayer.age,
                      pace: _editedPlayer.pace,
                      shooting: _editedPlayer.shooting,
                      passing: _editedPlayer.passing,
                      dribbling: _editedPlayer.dribbling,
                      defending: _editedPlayer.defending,
                      physical: _editedPlayer.physical,
                      overall: int.parse(newValue!),
                      nationality: _editedPlayer.nationality,
                      team: _editedPlayer.team,
                      imageUrl: _editedPlayer.imageUrl,
                      clubImageUrl: _editedPlayer.clubImageUrl,
                    );
                  },
                ),
                TextFormField(
                  initialValue: _initValues['nationality'],
                  decoration: InputDecoration(
                    labelText: 'Nationality',
                  ),
                  textInputAction: TextInputAction.next,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  }),
                  onSaved: (newValue) {
                    _editedPlayer = Player(
                      id: _editedPlayer.id,
                      name: _editedPlayer.name,
                      age: _editedPlayer.age,
                      pace: _editedPlayer.pace,
                      shooting: _editedPlayer.shooting,
                      passing: _editedPlayer.passing,
                      dribbling: _editedPlayer.dribbling,
                      defending: _editedPlayer.defending,
                      physical: _editedPlayer.physical,
                      overall: _editedPlayer.overall,
                      nationality: newValue,
                      team: _editedPlayer.team,
                      imageUrl: _editedPlayer.imageUrl,
                      clubImageUrl: _editedPlayer.clubImageUrl,
                    );
                  },
                ),
                TextFormField(
                  initialValue: _initValues['team'],
                  decoration: InputDecoration(
                    labelText: 'Team',
                  ),
                  textInputAction: TextInputAction.next,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  }),
                  onSaved: (newValue) {
                    _editedPlayer = Player(
                      id: _editedPlayer.id,
                      name: _editedPlayer.name,
                      age: _editedPlayer.age,
                      pace: _editedPlayer.pace,
                      shooting: _editedPlayer.shooting,
                      passing: _editedPlayer.passing,
                      dribbling: _editedPlayer.dribbling,
                      defending: _editedPlayer.defending,
                      physical: _editedPlayer.physical,
                      overall: _editedPlayer.overall,
                      nationality: _editedPlayer.nationality,
                      team: newValue,
                      imageUrl: _editedPlayer.imageUrl,
                      clubImageUrl: _editedPlayer.clubImageUrl,
                    );
                  },
                ),
                TextFormField(
                  initialValue: _initValues['pace'],
                  decoration: InputDecoration(
                    labelText: 'Pace',
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  }),
                  onSaved: (newValue) {
                    _editedPlayer = Player(
                      id: _editedPlayer.id,
                      name: _editedPlayer.name,
                      age: _editedPlayer.age,
                      pace: int.parse(newValue!),
                      shooting: _editedPlayer.shooting,
                      passing: _editedPlayer.passing,
                      dribbling: _editedPlayer.dribbling,
                      defending: _editedPlayer.defending,
                      physical: _editedPlayer.physical,
                      overall: _editedPlayer.overall,
                      nationality: _editedPlayer.nationality,
                      team: _editedPlayer.team,
                      imageUrl: _editedPlayer.imageUrl,
                      clubImageUrl: _editedPlayer.clubImageUrl,
                    );
                  },
                ),
                TextFormField(
                  initialValue: _initValues['shooting'],
                  decoration: InputDecoration(
                    labelText: 'Shooting',
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  }),
                  onSaved: (newValue) {
                    _editedPlayer = Player(
                      id: _editedPlayer.id,
                      name: _editedPlayer.name,
                      age: _editedPlayer.age,
                      pace: _editedPlayer.pace,
                      shooting: int.parse(newValue!),
                      passing: _editedPlayer.passing,
                      dribbling: _editedPlayer.dribbling,
                      defending: _editedPlayer.defending,
                      physical: _editedPlayer.physical,
                      overall: _editedPlayer.overall,
                      nationality: _editedPlayer.nationality,
                      team: _editedPlayer.team,
                      imageUrl: _editedPlayer.imageUrl,
                      clubImageUrl: _editedPlayer.clubImageUrl,
                    );
                  },
                ),
                TextFormField(
                  initialValue: _initValues['passing'],
                  decoration: InputDecoration(
                    labelText: 'Passing',
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  }),
                  onSaved: (newValue) {
                    _editedPlayer = Player(
                      id: _editedPlayer.id,
                      name: _editedPlayer.name,
                      age: _editedPlayer.age,
                      pace: _editedPlayer.pace,
                      shooting: _editedPlayer.shooting,
                      passing: int.parse(newValue!),
                      dribbling: _editedPlayer.dribbling,
                      defending: _editedPlayer.defending,
                      physical: _editedPlayer.physical,
                      overall: _editedPlayer.overall,
                      nationality: _editedPlayer.nationality,
                      team: _editedPlayer.team,
                      imageUrl: _editedPlayer.imageUrl,
                      clubImageUrl: _editedPlayer.clubImageUrl,
                    );
                  },
                ),
                TextFormField(
                  initialValue: _initValues['dribbling'],
                  decoration: InputDecoration(
                    labelText: 'Dribbling',
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  }),
                  onSaved: (newValue) {
                    _editedPlayer = Player(
                      id: _editedPlayer.id,
                      name: _editedPlayer.name,
                      age: _editedPlayer.age,
                      pace: _editedPlayer.pace,
                      shooting: _editedPlayer.shooting,
                      passing: _editedPlayer.passing,
                      dribbling: int.parse(newValue!),
                      defending: _editedPlayer.defending,
                      physical: _editedPlayer.physical,
                      overall: _editedPlayer.overall,
                      nationality: _editedPlayer.nationality,
                      team: _editedPlayer.team,
                      imageUrl: _editedPlayer.imageUrl,
                      clubImageUrl: _editedPlayer.clubImageUrl,
                    );
                  },
                ),
                TextFormField(
                  initialValue: _initValues['defending'],
                  decoration: InputDecoration(
                    labelText: 'Defending',
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  }),
                  onSaved: (newValue) {
                    _editedPlayer = Player(
                      id: _editedPlayer.id,
                      name: _editedPlayer.name,
                      age: _editedPlayer.age,
                      pace: _editedPlayer.pace,
                      shooting: _editedPlayer.shooting,
                      passing: _editedPlayer.passing,
                      dribbling: _editedPlayer.dribbling,
                      defending: int.parse(newValue!),
                      physical: _editedPlayer.physical,
                      overall: _editedPlayer.overall,
                      nationality: _editedPlayer.nationality,
                      team: _editedPlayer.team,
                      imageUrl: _editedPlayer.imageUrl,
                      clubImageUrl: _editedPlayer.clubImageUrl,
                    );
                  },
                ),
                TextFormField(
                  initialValue: _initValues['physical'],
                  decoration: InputDecoration(
                    labelText: 'Physical',
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  }),
                  onSaved: (newValue) {
                    _editedPlayer = Player(
                      id: _editedPlayer.id,
                      name: _editedPlayer.name,
                      age: _editedPlayer.age,
                      pace: _editedPlayer.pace,
                      shooting: _editedPlayer.shooting,
                      passing: _editedPlayer.passing,
                      dribbling: _editedPlayer.dribbling,
                      defending: _editedPlayer.defending,
                      physical: int.parse(newValue!),
                      overall: _editedPlayer.overall,
                      nationality: _editedPlayer.nationality,
                      team: _editedPlayer.team,
                      imageUrl: _editedPlayer.imageUrl,
                      clubImageUrl: _editedPlayer.clubImageUrl,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Club Image Url'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.url,
                  maxLines: 2,
                  controller: _clubImageUrlController,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  }),
                  onEditingComplete: () {
                    setState(() {});
                  },
                  onSaved: (newValue) {
                    _editedPlayer = Player(
                      id: _editedPlayer.id,
                      name: _editedPlayer.name,
                      age: _editedPlayer.age,
                      pace: _editedPlayer.pace,
                      shooting: _editedPlayer.shooting,
                      passing: _editedPlayer.passing,
                      dribbling: _editedPlayer.dribbling,
                      defending: _editedPlayer.defending,
                      physical: _editedPlayer.physical,
                      overall: _editedPlayer.overall,
                      nationality: _editedPlayer.nationality,
                      team: _editedPlayer.team,
                      imageUrl: _editedPlayer.imageUrl,
                      clubImageUrl: newValue,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Image Url'),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.url,
                  maxLines: 2,
                  controller: _imageUrlController,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please provide a value';
                    }
                    return null;
                  }),
                  onEditingComplete: () {
                    setState(() {});
                  },
                  onFieldSubmitted: (value) {
                    _saveForm();
                  },
                  onSaved: (newValue) {
                    _editedPlayer = Player(
                      id: _editedPlayer.id,
                      name: _editedPlayer.name,
                      age: _editedPlayer.age,
                      pace: _editedPlayer.pace,
                      shooting: _editedPlayer.shooting,
                      passing: _editedPlayer.passing,
                      dribbling: _editedPlayer.dribbling,
                      defending: _editedPlayer.defending,
                      physical: _editedPlayer.physical,
                      overall: _editedPlayer.overall,
                      nationality: _editedPlayer.nationality,
                      team: _editedPlayer.team,
                      imageUrl: newValue,
                      clubImageUrl: _editedPlayer.clubImageUrl,
                    );
                  },
                ),
                if (ModalRoute.of(context)!.settings.arguments != null)
                  TextButton(
                    style: ButtonStyle(
                      alignment: Alignment.bottomRight,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Provider.of<Players>(context, listen: false)
                          .deletePlayer(_editedPlayer.id!);
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Delete Player',
                      style: TextStyle(
                        color: Theme.of(context).errorColor,
                      ),
                    ),
                  ),
                Center(
                  child: _editedPlayer.id == null
                      ? SizedBox()
                      : Image.network(_editedPlayer.imageUrl!),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
