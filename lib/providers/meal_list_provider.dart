import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MealListProvider with ChangeNotifier {

  int _homePageIndex = 0;
  String _input = "";

  // continue from last recipe
  Box box = Hive.box('recipex');

  // getters
  int get getHomePageIndex => _homePageIndex;
  String get getInput => _input;

  // setters
  set setHomePageIndex(int index) {
    _homePageIndex = index;
    notifyListeners();
  }

  set setInput(String input) {
    _input = input;
    notifyListeners();
  }

}
