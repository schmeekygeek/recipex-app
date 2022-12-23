import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Dark {
  static const Color base = Color(0xff1e1e2e);
  static const Color crust = Color(0xff11111b);
  static const Color blue = Color(0xff89b4fa);
  static const Color text = Color(0xfff5e0dc);
  static const Color surface0 = Color(0xff313244);
}

class White {
  static const Color base = Color(0xffeff1f5);
  static const Color crust = Color(0xffdce0e8);
  static const Color blue = Color(0xff1e66f5);
  static const Color text = Color(0xff4c4f69);
  static const Color surface0 = Color(0xffccd0da);
}

class ThemeModel with ChangeNotifier {
  static ThemeData buildDarkTheme() {
    return ThemeData.dark().copyWith(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: Dark.crust,
      appBarTheme: const AppBarTheme(
        color: Dark.base,
        actionsIconTheme: IconThemeData(
          color: Dark.text,
          size: 24,
        ),
        toolbarTextStyle: TextStyle(
          color: Dark.text,
          fontFamily: "Inter",
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontSize: 18,
          wordSpacing: 1,
          letterSpacing: 1,
          fontFamily: "RobotoSlab",
          color: Dark.text,
          fontWeight: FontWeight.w100,
        ),
        headlineMedium: TextStyle(
          fontSize: 38,
          fontFamily: "Lora",
          color: Dark.text,
        ),
        headlineSmall: TextStyle(
          color: Dark.text,
          fontFamily: "Inter",
          fontSize: 17,
          letterSpacing: 1,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: Dark.text,
          fontFamily: "Inter",
          fontSize: 18,
          letterSpacing: 1,
          fontWeight: FontWeight.w400,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        hoverColor: Colors.transparent,
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        fillColor: Dark.surface0,
        hintStyle: TextStyle(
          color: White.crust,
          fontFamily: "Inter",
          fontSize: 18,
          letterSpacing: 1,
          fontWeight: FontWeight.normal,
        ),
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
        textStyle: MaterialStatePropertyAll<TextStyle>(
          TextStyle(
            color: Dark.text,
            fontFamily: "Inter",
            fontSize: 18,
            letterSpacing: 1,
            fontWeight: FontWeight.w400,
          ),
        ),
          backgroundColor:
              MaterialStatePropertyAll(Colors.transparent),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
        ),
      )
    );
  }

  static ThemeData buildLightTheme() {
    return ThemeData.light().copyWith(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: White.base,
      appBarTheme: const AppBarTheme(
        color: White.crust,
        actionsIconTheme: IconThemeData(
          color: White.text,
          size: 24,
        ),
        toolbarTextStyle: TextStyle(
          color: White.text,
          fontFamily: "Inter",
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontSize: 18,
          wordSpacing: 1,
          letterSpacing: 1,
          fontFamily: "RobotoSlab",
          color: White.text,
          fontWeight: FontWeight.w100,
        ),
        headlineMedium: TextStyle(
          fontSize: 38,
          fontFamily: "Lora",
          color: White.text,
        ),
        headlineSmall: TextStyle(
          color: White.text,
          fontFamily: "Inter",
          fontSize: 17,
          letterSpacing: 1,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: White.text,
          fontFamily: "Inter",
          fontSize: 18,
          letterSpacing: 1,
          fontWeight: FontWeight.w400,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        hoverColor: Colors.transparent,
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        fillColor: White.surface0,
        hintStyle: TextStyle(
          color: Dark.base,
          fontFamily: "Inter",
          fontSize: 18,
          letterSpacing: 1,
          fontWeight: FontWeight.normal,
        ),
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStatePropertyAll<TextStyle>(
            TextStyle(
              color: White.text,
              fontFamily: "Inter",
              fontSize: 18,
              letterSpacing: 1,
              fontWeight: FontWeight.w400,
            ),
          ),
          backgroundColor:
              MaterialStatePropertyAll(Colors.transparent),
          foregroundColor: MaterialStatePropertyAll(Colors.black),
        ),
      )
    );
  }

  var box = Hive.box('recipex');
  bool isDark = Hive.box('recipex').get(0) ?? false;

  void toggle() {
    isDark = !isDark;
    box.put(0, isDark);
    notifyListeners();
  }
}
