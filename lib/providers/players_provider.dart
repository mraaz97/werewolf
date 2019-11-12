import 'package:flutter/material.dart';

enum RoleType { Seer, Healer, LoveBird, Killer, Citizen }

class PlayersProvider extends ChangeNotifier {
  ///to-do: implement that user can choose number of killers himself

  final Map<String, String> _playersMap = <String, String>{};

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
    var playerNames = playersMap.keys.toList();

    var myList = [for (int i = 0; i < playerNames.length; i++) i];
    myList.shuffle();
    print(myList.take(7));
    return myList;
  }

  void assignRole() {
    ///to-do: Make it absulutely undbreakable
    try {
      var playerNames = playersMap.keys.toList();
      var l = randomNumberGenerator();
      print('###############################################');
      int rN1 = l[0]; //Heiler

      int rN2 = l[1]; //Seher

      int rN3 = l[2]; // Mörder

      int rN4 = l[3]; // Mörder

      int rN5 = l[4]; // Mörder

      int rN6 = l[5]; //Liebespaar 1

      int rN7 = l[6]; //Liebespaar 2

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
}
