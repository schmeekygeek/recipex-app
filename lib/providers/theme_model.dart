import 'package:flutter/material.dart';

class ThemeModel with ChangeNotifier {

  static ThemeData buildDarkTheme(){
    return ThemeData.dark().copyWith(
      useMaterial3: true,
    );
  }

  static ThemeData buildLightTheme(){
    return ThemeData.light().copyWith(
      useMaterial3: true,
    );
  }

  bool isDark = true;

  void toggle(){
    isDark = !isDark;
    notifyListeners();
  }
}
