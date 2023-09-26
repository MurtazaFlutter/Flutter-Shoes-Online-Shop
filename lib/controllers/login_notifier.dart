import 'package:flutter/material.dart';

class LoginNotifier extends ChangeNotifier {
  bool _isObsecure = false;

  bool get isObsecure => _isObsecure;

  set isObsecure(bool newState) {
    _isObsecure = newState;
    notifyListeners();
  }
}
