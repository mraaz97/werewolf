import 'dart:math';
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';

enum RoleType { Seer, Healer, LoveBird, Killer, Citizen }

int seer = 1;
int healer = 1;
int loveBird = 2;
int killer = 4;
int amor = 1;

class PlayersProvider extends ChangeNotifier {
  ///to-do: implement that user can choose number of killers himself

  final Map<String, String> _playersMap = <String, String>{
    'Matthias': 'Bürger',
    'Lea': 'Bürger',
    'Spieler 3': ' Bürger',
    'Spieler 4': ' Bürger',
    'Spieler 5': ' Bürger',
    'Spieler 6': ' Bürger',
    'Spieler 7': ' Bürger',
    'Spieler 8': ' Bürger',
    'Spieler 9': ' Bürger',
    'Spieler 10': ' Bürger',
    'Spieler 11': ' Bürger',
    'Spieler 12': ' Bürger',
    'Spieler 13': ' Bürger',
    'Spieler 14': ' Bürger',
    'Spieler 15': ' Bürger',
    'Spieler 16': ' Bürger',
    'Spieler 17': ' Bürger',
  };

  Map<String, String> get playersMap {
    return _playersMap;
  }

  void addPlayer(String name) {
    _playersMap.putIfAbsent(name, () => 'Bürger');
    print(playersMap);
    notifyListeners();
  }

  void removePlayer(String name) {
    _playersMap.remove(name);
    notifyListeners();
  }

  void assignRole() {
    ///to-do: Make it absulutely undbreakable
    try {
      var playerNames = playersMap.keys.toList();
      List l = randomNumberGenerator();
      int rN1 = l[0];
      print('###############################################');
      print(rN1); //Heiler
      int rN2 = l[1];
      print(rN2); //Seher
      int rN3 = l[2];
      print(rN3); // Mörder
      int rN4 = l[3];
      print(rN4); // Mörder
      int rN5 = l[4];
      print(rN5); // Mörder
      int rN6 = l[5];
      print(rN6); //Liebespaar 1
      int rN7 = l[6];
      print(rN7); //Liebespaar 2

      String name1 = playerNames[rN1];
      String name2 = playerNames[rN2];
      String name3 = playerNames[rN3];
      String name4 = playerNames[rN4];
      String name5 = playerNames[rN5];
      String name6 = playerNames[rN6];
      String name7 = playerNames[rN7];
      _playersMap.update(name1, (String role) => 'Heiler');
      _playersMap.update(name2, (String role) => 'Seher');
      _playersMap.update(name3, (String role) => 'Mörder');
      _playersMap.update(name4, (String role) => 'Mörder');
      _playersMap.update(name5, (String role) => 'Mörder');
      _playersMap.update(name6, (String role) => 'Liebespaar 1');
      _playersMap.update(name7, (String role) => 'Liebespaar 2');
      notifyListeners();
    } catch (e) {
      print('I domnt know what is going on heerrreee');
    }
  }

//
  void resetGame() {
    playersMap.clear();
    notifyListeners();
  }

  void resetRoles() {
    _playersMap.forEach(
        (key, value) => _playersMap.update(key, (String value) => 'Bürger'));
    notifyListeners();
  }

  List randomNumberGenerator() {
    var rng = new Random();
    var playerNames = playersMap.keys.toList();
    Map<int, int> randomNumbersMap = {};

    for (int i = 0; i < 8; i++) {
      int number = rng.nextInt(playerNames.length);
      randomNumbersMap.putIfAbsent(number, () => number);
    }
    List numberList = randomNumbersMap.keys.toList();
    randomNumbersMap.clear();
    print('#### $numberList ######');
    return numberList;
  }
}
