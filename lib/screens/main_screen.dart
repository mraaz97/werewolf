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
    var playersList = loadedPlayersData.playersList;
    int playersCount = playersList.length;

    return Scaffold(
      body: ListView.builder(
          itemCount: playersList.length,
          itemBuilder: (context, i) => Card(
                color: Colors.white30,
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text(playersList[i].name),
                  subtitle: Text(playersList[i].role),
                  trailing: IconButton(
                    color: Colors.red,
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      loadedPlayersData.removePlayer(i);
                    },
                  ),
                ),
              )),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.tag_faces),
        backgroundColor: Colors.teal,
        title: Text('Werwolf'),
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
              loadedPlayersData.assignRole(playersList);
            }
          )
        ],
      ),
    );
  }
}
