import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider with ChangeNotifier {
  String _themeMode = 'dark';

  bool get isDarkMode => _themeMode == 'dark';

  final key = 'app_theme';

  void setTheme(String? theme) {
    _themeMode = theme ?? 'dark';
    notifyListeners();
  }

  void getTheme() async {
    final shared = SharedPreferencesAsync();
    final currentTheme = (await shared.getString(key));

    setTheme(currentTheme);
  }

  void toggleTheme() async {
    final selectedTheme = _themeMode == 'dark' ? 'light' : 'dark';
    final shared = SharedPreferencesAsync();
    shared.setString(key, selectedTheme);
    _themeMode = selectedTheme;
    notifyListeners();
  }
}
