import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webapp/providers/player_provider.dart';
import 'package:webapp/providers/players_provider.dart';
import 'package:webapp/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlayersProvider>(
      builder: (BuildContext context) =>  PlayersProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}


