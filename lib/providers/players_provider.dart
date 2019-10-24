import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webapp/providers/player_provider.dart';

enum RoleType { Seer, Healer, LoveBird, Killer, Citizen }

const int seer = 1;
const int healer = 1;
const int loveBird = 2;
const int killer = 4;

class PlayersProvider extends ChangeNotifier {
  ///to-do: implement that user can choose number of killers himself

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

  String getRoleTypeString(List playersList) {
    for (int i = 0; i < playersList.length; i++) {
      if (playersList[i] == RoleType.Seer) {
        return 'Seher';
      } else if (playersList[i] == RoleType.Healer) {
        return 'Heiler';
      } else if (playersList[i] == RoleType.Killer) {
        return 'Mörder';
      } else if (playersList[i] == RoleType.LoveBird) {
        return 'Liebespaar';
      }
    }
    return 'Bürger';
  }

  void assignRole(List playersList) {
    try {
      int rN1 = Random().nextInt(playersList.length);
      int rN2 = Random().nextInt(playersList.length);
      int rN3 = Random().nextInt(playersList.length);
      int rN4 = Random().nextInt(playersList.length);
      do {
        for (int i = 1; i < playersList.length; i++) {
//

//
//
//          playersList[rN2].role = 'Heiler';
//
//
//         playersList[rN3].role = 'LiebesPaar';
//
//         playersList[rN4].role = 'Seher';
        }
      } while (((rN1 != rN2) != rN3) != rN4);

      notifyListeners();
    }
    catch (e) {
      print('unexpected Error');
    }
  }
}
