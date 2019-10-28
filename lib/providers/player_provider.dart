import 'package:flutter/foundation.dart';

class PlayerProvider with ChangeNotifier {
  final String name;
  final String role;

  PlayerProvider(@required this.name, @required this.role);
}
