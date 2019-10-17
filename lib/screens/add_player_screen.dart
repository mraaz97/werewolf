import 'package:flutter/material.dart';
import 'package:webapp/providers/players_provider.dart';
import 'package:provider/provider.dart';

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
              controller: myController,
              decoration:
                  InputDecoration(labelText: 'Neuen Spieler hinzufügen'),
              onChanged: (value) => newPlayer = value,
            ),
            FlatButton(
                color: Colors.teal,
                onPressed: () {

                  if(newPlayer.isEmpty) {
                    Navigator.of(context).pop();
                  }
                  playersData.addPlayer(newPlayer);
                  Navigator.of(context).pop();
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
        title: Text('Neuen Spieler Hinzufügen'),
      ),
    );
  }
}
