import 'package:flutter/material.dart';
import 'package:webapp/providers/player_provider.dart';

class PlayersProvider extends ChangeNotifier {
  List<PlayerProvider> _playersList = [];

  List<PlayerProvider> get playersList {
    return [..._playersList];
  }

  void addPlayer(String name) {
    PlayerProvider newPlayer = PlayerProvider(name: name, role: 'Bürger');
    _playersList.add(newPlayer);
    notifyListeners();
  }

  void removePlayer(int index) {
    _playersList.removeAt(index);
    notifyListeners();
  }
}
