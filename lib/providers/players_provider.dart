import 'dart:math';

import 'package:flutter/material.dart';
import 'package:webapp/providers/player_provider.dart';

enum RoleType { Seer, Healer, LoveBird, Killer, Citizen }

int seer = 1;
int healer = 1;
int loveBird = 2;
int killer = 4;
int amor = 1;

class PlayersProvider extends ChangeNotifier {
  ///to-do: implement that user can choose number of killers himself

  List<PlayerProvider> _playersList = [
    PlayerProvider('1', 'Bürger'),
    PlayerProvider('2', 'Bürger'),
    PlayerProvider('3', 'Bürger'),
    PlayerProvider('4', 'Bürger'),
    PlayerProvider('5', 'Bürger'),
    PlayerProvider('6', 'Bürger'),
    PlayerProvider('7', 'Bürger'),
    PlayerProvider('8', 'Bürger'),
    PlayerProvider('9', 'Bürger'),
    PlayerProvider('10', 'Bürger'),
    PlayerProvider('11', 'Bürger'),
    PlayerProvider('12', 'Bürger'),
    PlayerProvider('13', 'Bürger'),
    PlayerProvider('14', 'Bürger'),
    PlayerProvider('15', 'Bürger'),
    PlayerProvider('16', 'Bürger'),
    PlayerProvider('17', 'Bürger'),
    PlayerProvider('18', 'Bürger'),
    PlayerProvider('19', 'Bürger'),
  ];

  List<PlayerProvider> get playersList {
    return [..._playersList];
  }

  void addPlayer(String name) {
    PlayerProvider newPlayer = PlayerProvider(name, 'Bürger');
    _playersList.add(newPlayer);
    notifyListeners();
  }

  void removePlayer(int index) {
    _playersList.removeAt(index);
    notifyListeners();
  }

  void shufflePlayer(String name, String role) {
    PlayerProvider newPlayer = PlayerProvider(name, role);
    _playersList.add(newPlayer);
    notifyListeners();
  }

  int randomNumber(List playersList, List<int> randomNumbers) {
    ///to-do: currnetly there still is a chance that the same number gets randomly picked
    int randomNumber = Random().nextInt(playersList.length);
    for (int i = 0; i < randomNumbers.length; i++) {
      if (randomNumber == randomNumbers[i]) {
        randomNumber = Random().nextInt(playersList.length);
      }
    }

    return randomNumber;
  }

  void assignRole(List playersList) {
    int rN1 = randomNumber(playersList, []);
    print(playersList.length);
    print('###############################################');
    print(rN1); //Heiler
    int rN2 = randomNumber(playersList, [rN1]);
    print(rN2); //Seher
    int rN3 = randomNumber(playersList, [rN1, rN2]);
    print(rN3); // Mörder
    int rN4 = randomNumber(playersList, [rN1, rN2, rN3]);
    print(rN4); // Mörder
    int rN5 = randomNumber(playersList, [rN1, rN2, rN3, rN4]);
    print(rN5); // Mörder
    int rN6 = randomNumber(playersList, [rN1, rN2, rN3, rN4, rN5]);
    print(rN6); //Liebespaar
    int rN7 = randomNumber(playersList, [rN1, rN2, rN3, rN4, rN5, rN6]);
    print(rN7);

    String name1 = playersList[rN1].name;
    String name2 = playersList[rN2].name;
    String name3 = playersList[rN3].name;
    String name4 = playersList[rN4].name;
    String name5 = playersList[rN5].name;
    String name6 = playersList[rN6].name;
    String name7 = playersList[rN7].name;

    removePlayer(rN1);
    shufflePlayer(name1, 'Heiler');
    removePlayer(rN2);
    shufflePlayer(name2, 'Seher');
    removePlayer(rN3);
    shufflePlayer(name3, 'Mörder 1');
    removePlayer(rN4);
    shufflePlayer(name4, 'Mörder 2');
    removePlayer(rN5);
    shufflePlayer(name5, 'Mörder 3');
    removePlayer(rN6);
    shufflePlayer(name6, 'Liebespaar 1');
    removePlayer(rN7);
    shufflePlayer(name7, 'Liebespaar 2');
    notifyListeners();
  }

  void resetRoles(List playersList) {
    for (int i = 0; i < playersList.length; i++) {
      String name = playersList[i].name;
      removePlayer(i);
      addPlayer(name);
      notifyListeners();
    }
  }
}
