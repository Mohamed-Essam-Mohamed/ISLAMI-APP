import 'package:flutter/material.dart';

class ChangeLunguageApp extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  void changeTheme(ThemeMode newThemMode) {
    if (themeMode == newThemMode) {
      return;
    }
    themeMode = newThemMode;
    notifyListeners();
  }

  String appLunguage = 'en';
  void changeLunguage(String newLunguage) {
    if (appLunguage == newLunguage) {
      return;
    }
    appLunguage = newLunguage;
    notifyListeners();
  }
}
