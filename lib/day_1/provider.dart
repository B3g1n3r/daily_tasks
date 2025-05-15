import 'package:daily_tasks/day_1/themes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkTheme = true;
  late ThemeData _themeData;

  ThemeProvider() {
    _themeData = darkTheme; // prevent late init error
    _loadTheme();
  }

  ThemeData get themeMode => _themeData;

  Future<void> _loadTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isDarkTheme = pref.getBool('theme') ?? false;
    _themeData = isDarkTheme ? darkTheme : lightTheme;
    notifyListeners();
  }

  void toggle(bool isDark) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isDarkTheme = isDark;
    _themeData = isDark ? darkTheme : lightTheme;
    await pref.setBool('theme', isDark);
    notifyListeners();
  }
}
