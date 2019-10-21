import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webapp/providers/players_provider.dart';
import 'package:webapp/utilities/constants.dart';

class AddPlayerScreen extends StatelessWidget {
  final myController = TextEditingController();
  String newPlayer;

  @override
  Widget build(BuildContext context) {
    var playersData = Provider.of<PlayersProvider>(context);
    return Scaffold(
      body: Container(
        child: Card(
            child: Column(
          children: <Widget>[
            TextField(
              decoration: kTextFieldInputDecoration,
              controller: myController,
              onChanged: (value) => newPlayer = value,
            ),
            FlatButton(
                color: Colors.teal,
                onPressed: () {
                  if (newPlayer == null) {
                    Navigator.of(context).pop();
                  } else {
                    playersData.addPlayer(newPlayer);
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Spieler hinzufügen')),
          ],
        )),
      ),
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
