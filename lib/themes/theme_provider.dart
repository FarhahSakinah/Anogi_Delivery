import 'package:flutter/material.dart';
import 'package:anogi_delivery/themes/dark_mode.dart';
import 'package:anogi_delivery/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      _themeData = darkMode;
    } else {
      _themeData = lightMode;
    }
    notifyListeners();  // <-- Add this line to notify listeners about the change
  }
}
