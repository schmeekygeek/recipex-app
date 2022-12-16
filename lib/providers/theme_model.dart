import 'package:flutter/material.dart';

class Dark {
  static const Color _base = Color(0xff1e1e2e);
  static const Color _crust = Color(0xff11111b);
  static const Color _blue = Color(0xff89b4fa);
  static const Color _text = Color(0xfff5e0dc);
  static const Color _surface0 = Color(0xff313244);
}

class White {
  static const Color _base = Color(0xffeff1f5);
  static const Color _crust = Color(0xffdce0e8);
  static const Color _blue = Color(0xff1e66f5);
  static const Color _text = Color(0xff4c4f69);
  static const Color _surface0 = Color(0xffccd0da);
}

class ThemeModel with ChangeNotifier {
  static ThemeData buildDarkTheme() {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: Dark._crust,
      appBarTheme: const AppBarTheme(
        color: Dark._base,
        actionsIconTheme: IconThemeData(
          color: Dark._blue,
          size: 24,
        ),
        toolbarTextStyle: TextStyle(
          color: Dark._text,
          fontFamily: "SpaceGrotesk",
          letterSpacing: 2,
          fontWeight: FontWeight.w500,
          fontSize: 24,
        ),
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontSize: 15,
          wordSpacing: 1,
          letterSpacing: 1,
          fontFamily: "Lora",
          color: Dark._text,
          fontWeight: FontWeight.w100,
        ),
        headlineMedium: TextStyle(
          fontSize: 38,
          fontFamily: "Lora",
          color: Dark._text,
        ),
        headlineSmall: TextStyle(
          color: Dark._text,
          fontFamily: "SpaceGrotesk",
          fontSize: 17,
          letterSpacing: 1,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: Dark._text,
          fontFamily: "SpaceGrotesk",
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
        fillColor: Dark._surface0,
        hintStyle: TextStyle(
          color: White._crust,
          fontFamily: "SpaceGrotesk",
          fontSize: 15,
          letterSpacing: 1,
          fontWeight: FontWeight.normal,
        ),
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
        textStyle: MaterialStatePropertyAll<TextStyle>(
          TextStyle(
            color: Dark._text,
            fontFamily: "SpaceGrotesk",
            fontSize: 16,
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
      useMaterial3: true,
      scaffoldBackgroundColor: White._base,
      appBarTheme: const AppBarTheme(
        color: White._crust,
        actionsIconTheme: IconThemeData(
          color: White._blue,
          size: 24,
        ),
        toolbarTextStyle: TextStyle(
          color: White._text,
          fontFamily: "SpaceGrotesk",
          letterSpacing: 2,
          fontWeight: FontWeight.w500,
          fontSize: 24,
        ),
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontSize: 15,
          wordSpacing: 1,
          letterSpacing: 1,
          fontFamily: "Lora",
          color: White._text,
          fontWeight: FontWeight.w100,
        ),
        headlineMedium: TextStyle(
          fontSize: 38,
          fontFamily: "Lora",
          color: White._text,
        ),
        headlineSmall: TextStyle(
          color: White._text,
          fontFamily: "SpaceGrotesk",
          fontSize: 17,
          letterSpacing: 1,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: White._text,
          fontFamily: "SpaceGrotesk",
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
        fillColor: White._surface0,
        hintStyle: TextStyle(
          color: Dark._base,
          fontFamily: "SpaceGrotesk",
          fontSize: 15,
          letterSpacing: 1,
          fontWeight: FontWeight.normal,
        ),
      ),
      textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStatePropertyAll<TextStyle>(
            TextStyle(
              color: White._text,
              fontFamily: "SpaceGrotesk",
              fontSize: 15,
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

  bool isDark = false;

  void toggle() {
    isDark = !isDark;
    notifyListeners();
  }
}
