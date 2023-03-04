import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        systemOverlayStyle: SystemUiOverlayStyle.light,
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
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Dark.base,
        contentPadding: const EdgeInsets.only(
          left: 13,
          right: 7,
        ),
        hintStyle: TextStyle(
          fontFamily: "Satoshi",
          fontSize: 14,
          letterSpacing: 1.5,
          color: Dark.text.withOpacity(0.8),
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: White.crust,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.green,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorStyle: const TextStyle(
          fontSize: 16,
          letterSpacing: 1,
          color: Colors.redAccent,
          fontWeight: FontWeight.w600,
        ),
        suffixIconColor: Dark.text,
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
          backgroundColor: MaterialStatePropertyAll(
            Colors.transparent,
          ),
          foregroundColor: MaterialStatePropertyAll(Colors.white),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(
            White.text,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontSize: 18,
              fontFamily: "Staatliches",
              letterSpacing: 1,
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(
            White.crust,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(
            Dark.text,
          ),
          side: const MaterialStatePropertyAll(
            BorderSide(
              color: Dark.text,
            ),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          iconSize: const MaterialStatePropertyAll(20),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontSize: 18,
              fontFamily: "Staatliches",
              letterSpacing: 1,
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(
            Colors.transparent,
          ),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Dark.crust,
        surfaceTintColor: Dark.base,
      ),
    );
  }

  static ThemeData buildLightTheme() {
    return ThemeData.light().copyWith(
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: White.crust,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
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
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white54,
        contentPadding: const EdgeInsets.only(
          left: 13,
          right: 7,
        ),
        hintStyle: TextStyle(
          fontFamily: "Satoshi",
          fontSize: 14,
          letterSpacing: 1.5,
          color: White.text.withOpacity(0.8),
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: White.crust,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.green,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorStyle: const TextStyle(
          fontSize: 16,
          letterSpacing: 1,
          color: Colors.redAccent,
          fontWeight: FontWeight.w600,
        ),
        suffixIconColor: White.text,
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
          backgroundColor: MaterialStatePropertyAll(
            Colors.transparent,
          ),
          foregroundColor: MaterialStatePropertyAll(
            Colors.white,
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(
            Dark.text,
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontSize: 18,
              fontFamily: "Staatliches",
              letterSpacing: 1,
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(
            Dark.crust,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(
            White.text,
          ),
          side: const MaterialStatePropertyAll(
            BorderSide(
              color: White.text,
            ),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          iconSize: const MaterialStatePropertyAll(20),
          textStyle: const MaterialStatePropertyAll(
            TextStyle(
              fontSize: 18,
              fontFamily: "Staatliches",
              letterSpacing: 1,
            ),
          ),
          backgroundColor: const MaterialStatePropertyAll(
            Colors.transparent,
          ),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: White.crust,
        surfaceTintColor: White.base,
      ),
    );
  }

  bool _isDark = Hive.box('recipex').get('dark') ?? true;
  bool get isDark => _isDark;

  void toggle() {
    _isDark = !_isDark;
    Hive.box('recipex').put('dark', _isDark);
    notifyListeners();
  }
}
