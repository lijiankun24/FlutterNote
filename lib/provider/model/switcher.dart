import 'package:flutter/material.dart';

class Switcher with ChangeNotifier {
  bool _status = false;

  bool get status => _status;
  
  void toggle() {
    _status = !_status;
    notifyListeners();
  }
}
