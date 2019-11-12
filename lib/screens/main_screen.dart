import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:webapp/providers/players_provider.dart';
import 'package:webapp/screens/add_player_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    var loadedPlayersData = Provider.of<PlayersProvider>(context);

    var playerNames = loadedPlayersData.playersMap.keys.toList();
    var playerRoles = loadedPlayersData.playersMap.values.toList();
    int playersCount = playerNames.length;
    return Scaffold(
      body: ListView.builder(
          itemCount: playerNames.length,
          itemBuilder: (context, i) => Card(
                color: Colors.white30,
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text(playerNames[i]),
                  subtitle: Text(
                    playerRoles[i],
                    style: TextStyle(
                      color: newTextStyle(playerRoles[i])
                          ? Colors.black
                          : Colors.teal,
                    ),
                  ),
                  trailing: IconButton(
                    color: Colors.red,
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      var name = playerNames[i];
                      loadedPlayersData.removePlayer(name);
                    },
                  ),
                ),
              )),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Werwolf'),
        actions: <Widget>[
          Icon((Icons.person)),
          Center(
              child: Text(
            playersCount.toString(),
            style: TextStyle(fontSize: 20.0),
          )),
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        closeManually: false,
        curve: Curves.bounceIn,
        onOpen: () => print('opening dialog'),
        onClose: () => print('close dialog'),
        tooltip: 'Optionen',
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            backgroundColor: Colors.red,
            label: 'Spieler hinzufügen',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddPlayerScreen();
              }));
            },
          ),
          SpeedDialChild(
              child: Icon(Icons.sync),
              backgroundColor: Colors.red,
              label: 'Rollen verteilen',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                loadedPlayersData.assignRole();
              }),
          SpeedDialChild(
              child: Icon(Icons.refresh),
              backgroundColor: Colors.red,
              label: 'Alle Rollen zurücksetzen',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () {
                loadedPlayersData.resetRoles();
              })
        ],
      ),
    );
  }
}

bool newTextStyle(String role) {
  if (role == 'Bürger') {
    return true;
  } else {
    return false;
  }
}
