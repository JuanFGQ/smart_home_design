import 'package:flutter/material.dart';

class Model with ChangeNotifier {
  int _index = 0;

  int get getIndex => _index;

  set getIndex(int value) {
    _index = value;
    notifyListeners();
  }
}
