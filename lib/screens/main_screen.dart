import 'package:flutter/material.dart';
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
        leading: IconButton(
            icon: Icon(Icons.sync),
            onPressed: () {
              loadedPlayersData.assignRole(playersList);
              print('***************************');
            }),
        backgroundColor: Colors.teal,
        title: Text('MörderGame ' + 'Spieleranzahl: ' + playersCount.toString()),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        icon: Icon(Icons.add),
        label: Text('Spieler hinzufügen'),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddPlayerScreen();
          }));
        },
      ),
    );
  }
}
