import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notium/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  bool _isDarkMode = false;

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _loadTheme();
  }

  /// Load saved theme from Hive
  void _loadTheme() {
    final box = Hive.box('settings');
    _isDarkMode = box.get('darkMode', defaultValue: false);
    _themeData = _isDarkMode ? darkMode : lightMode;
  }

  /// Setter if manually setting theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  /// Setter if manually setting dark mode
  set isDarkMode(bool value) {
    _isDarkMode = value;
    _themeData = value ? darkMode : lightMode;
    Hive.box('settings').put('darkMode', value);
    notifyListeners();
  }

  /// Toggle theme + persist
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _themeData = _isDarkMode ? darkMode : lightMode;

    Hive.box('settings').put('darkMode', _isDarkMode);

    notifyListeners();
  }
}
