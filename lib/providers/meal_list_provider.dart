import 'package:flutter/material.dart';

class MealListProvider with ChangeNotifier {

  String _input = "";

  String get getInput => _input;

  set setInput(String input) {
    _input = input;
    notifyListeners();
  }
}
