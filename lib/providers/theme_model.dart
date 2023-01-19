import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Dark {
  static const Color base = Color(0xff181d31);
  static const Color crust = Color(0xff11111b);
  static const Color blue = Color(0xff73b8ff);
  static const Color text = Color(0xfff0e9d2);
  static const Color surface0 = Color(0xff11151c);
}

class White {
  static const Color base = Color(0xffe6d2aa);
  static const Color crust = Color(0xfffffbeb);
  static const Color blue = Color(0xff55b4d4);
  static const Color text = Color(0xff251749);
  static const Color surface0 = Color(0xff8a9199);
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
          fontFamily: "ClashGrotesk",
          fontSize: 32,
          letterSpacing: 2,
          fontWeight: FontWeight.w100,
        ),
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontSize: 18,
          letterSpacing: 1,
          fontFamily: "Satoshi",
          color: Dark.text,
          fontWeight: FontWeight.w100,
        ),
        headlineMedium: TextStyle(
          fontSize: 38,
          fontFamily: "Lora",
          letterSpacing: 1,
          fontWeight: FontWeight.w200,
          color: Dark.text,
        ),
        headlineSmall: TextStyle(
          color: Dark.text,
          fontFamily: "Satoshi",
          fontSize: 17,
          letterSpacing: 1,
          fontWeight: FontWeight.w200,
        ),
        bodyMedium: TextStyle(
          color: Dark.text,
          fontFamily: "Satoshi",
          fontSize: 18,
          letterSpacing: 1,
          fontWeight: FontWeight.w200,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        hoverColor: Colors.transparent,
        focusedBorder: InputBorder.none,
        fillColor: Dark.surface0,
        hintStyle: TextStyle(
          color: Dark.text,
          fontFamily: "Satoshi",
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
              fontFamily: "Satoshi",
              fontSize: 18,
              letterSpacing: 1,
              fontWeight: FontWeight.w200,
            ),
          ),
          backgroundColor:
              MaterialStatePropertyAll(Colors.transparent),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Dark.crust,
        surfaceTintColor: Dark.base
      ),
    );
  }

  static ThemeData buildLightTheme() {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: White.crust,
      appBarTheme: const AppBarTheme(
        color: White.base,
        actionsIconTheme: IconThemeData(
          color: White.text,
          size: 24,
        ),
        toolbarTextStyle: TextStyle(
          color: White.text,
          fontFamily: "ClashGrotesk",
          fontSize: 32,
          letterSpacing: 2,
          fontWeight: FontWeight.w100,
        ),
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontSize: 18,
          letterSpacing: 1,
          fontFamily: "Satoshi",
          color: White.text,
          fontWeight: FontWeight.w100,
        ),
        headlineMedium: TextStyle(
          fontSize: 38,
          fontFamily: "Lora",
          letterSpacing: 1,
          fontWeight: FontWeight.w200,
          color: White.text,
        ),
        headlineSmall: TextStyle(
          color: White.text,
          fontFamily: "Satoshi",
          fontSize: 17,
          letterSpacing: 1,
          fontWeight: FontWeight.w200,
        ),
        bodyMedium: TextStyle(
          color: White.text,
          fontFamily: "Satoshi",
          fontSize: 18,
          letterSpacing: 1,
          fontWeight: FontWeight.w200,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        hoverColor: Colors.transparent,
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        fillColor: Dark.surface0,
        hintStyle: TextStyle(
          color: Dark.text,
          fontFamily: "Satoshi",
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
              fontFamily: "Satoshi",
              fontSize: 18,
              letterSpacing: 1,
              fontWeight: FontWeight.w200,
            ),
          ),
          backgroundColor:
              MaterialStatePropertyAll(Colors.transparent),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: White.crust,
        surfaceTintColor: White.base
      ),

    );
  }
  Box box = Hive.box('recipex');
  bool isDark = Hive.box('recipex').get('dark') ?? false;

  void toggle() {
    isDark = !isDark;
    box.put('dark', isDark);
    notifyListeners();
  }
}
