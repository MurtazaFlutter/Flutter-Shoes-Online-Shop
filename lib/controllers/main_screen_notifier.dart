import 'package:flutter/material.dart';

class MainScreenNotifier extends ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
