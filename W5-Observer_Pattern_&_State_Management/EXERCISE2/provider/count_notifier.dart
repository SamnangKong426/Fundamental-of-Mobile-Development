import 'package:flutter/material.dart';

// 1. Create a model (ColorCounters) to handle the 2 counters
class ColorCounters extends ChangeNotifier {
  int _redCount = 0;
  int _blueCount = 0;

  int get redCount => _redCount;
  int get blueCount => _blueCount;

  void incrementRed() {
    _redCount++;
    notifyListeners();
  }

  void incrementBlue() {
    _blueCount++;
    notifyListeners();
  }
}