import 'package:flutter/material.dart';
import 'package:anogi_delivery/themes/dark_mode.dart';
import 'package:anogi_delivery/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  bool _isDarkMode = false;

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _isDarkMode;

  set themeData(ThemeData theme) {
    _themeData = theme;
    _isDarkMode = (theme == darkMode);
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
      _isDarkMode = true;
    } else {
      _themeData = lightMode;
      _isDarkMode = false;
    }
    notifyListeners();
  }
}
