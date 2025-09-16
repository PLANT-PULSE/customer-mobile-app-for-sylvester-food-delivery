import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;
  ThemeMode _themeMode = ThemeMode.system;

  int get currentIndex => _currentIndex;
  ThemeMode get themeMode => _themeMode;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
