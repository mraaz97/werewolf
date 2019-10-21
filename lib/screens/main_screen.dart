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
    var players = loadedPlayersData.playersList;
    return Scaffold(
      body: ListView.builder(
          itemCount: players.length,
          itemBuilder: (context, i) => Card(
                color: Colors.white30,
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text(players[i].name),
                  subtitle: Text(players[i].role),
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
        leading: IconButton(icon: Icon(Icons.sync), onPressed: () {}),
        backgroundColor: Colors.teal,
        title: Text('MörderGame'),
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
