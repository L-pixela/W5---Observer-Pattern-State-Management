import 'package:flutter/material.dart';

class TapCounter with ChangeNotifier {
  int _redCount = 0;
  int _blueCount = 0;

  int get redCount => _redCount;
  int get blueCount => _blueCount;

  void incrementRed() {
    _redCount++;
    print("Red Count Updated!!!");
    notifyListeners();
  }

  void incrementBlue() {
    _blueCount++;
    print("Blue Count Updated!!!");
    notifyListeners();
  }
}
