import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fut_card/providers/team.dart';
import 'package:fut_card/providers/teams.dart';
import 'package:provider/provider.dart';

class EditTeamsScreen extends StatefulWidget {
  static const routeName = '/edit-teams';
  const EditTeamsScreen({super.key});

  @override
  State<EditTeamsScreen> createState() => _EditTeamsScreenState();
}

class _EditTeamsScreenState extends State<EditTeamsScreen> {
  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedTeam = Team(
    id: null,
    teamName: '',
    foundationYear: 0,
    imageUrl: '',
  );

  var _initValues = {
    'teamName': '',
    'foundationYear': '',
    'imageUrl': '',
  };

  var _isInit = true;

  Future<void> _saveForm() async {
    final isValid = _form.currentState!.validate();

    _form.currentState!.save();

    if (_editedTeam.id != null) {
      await Provider.of<Teams>(context, listen: false)
          .updateTeam(_editedTeam.id!, _editedTeam);
    } else {
      await Provider.of<Teams>(context, listen: false).addTeam(_editedTeam);
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
        final teamId = ModalRoute.of(context)!.settings.arguments as String;
        _editedTeam = Provider.of<Teams>(context).findById(teamId);

        if (teamId != null) {
          _initValues = {
            'teamName': _editedTeam.teamName!,
            'foundationYear': _editedTeam.foundationYear.toString(),
            'imageUrl': '',
          };
          _imageUrlController.text = _editedTeam.imageUrl!;
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
            ? Text('EDIT TEAM')
            : Text('ADD TEAM'),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 127, 169, 190),
              Color.fromARGB(159, 251, 251, 251),
            ],
          ),
        ),
        margin: EdgeInsets.only(top: 3, right: 5, left: 5),
        padding: EdgeInsets.all(12),
        child: Form(
          key: _form,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _initValues['teamName'],
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
                  _editedTeam = Team(
                      id: _editedTeam.id,
                      teamName: newValue,
                      foundationYear: _editedTeam.foundationYear,
                      imageUrl: _editedTeam.imageUrl);
                },
              ),
              TextFormField(
                initialValue: _initValues['foundationYear'],
                decoration: InputDecoration(
                  labelText: 'Foundation Year',
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
                  _editedTeam = Team(
                      id: _editedTeam.id,
                      teamName: _editedTeam.teamName,
                      foundationYear: int.parse(newValue!),
                      imageUrl: _editedTeam.imageUrl);
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
                  _editedTeam = Team(
                    id: _editedTeam.id,
                    teamName: _editedTeam.teamName,
                    foundationYear: _editedTeam.foundationYear,
                    imageUrl: newValue,
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
                    Provider.of<Teams>(context, listen: false)
                        .deleteTeam(_editedTeam.id!);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Delete Team',
                    style: TextStyle(
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                ),
              Center(
                child: _editedTeam.id == null
                    ? SizedBox()
                    : Image.network(_editedTeam.imageUrl!),
              )
            ],
          ),
        ),
      ),
    );
  }
}
