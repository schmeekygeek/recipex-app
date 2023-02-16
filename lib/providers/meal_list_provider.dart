import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../classes/base/base.dart';


class MealListProvider with ChangeNotifier {

  Base? base;
  int homePageIndex = 0;
  String input = "";
  int currentPageIndex = 0;
  bool _isPasswordVisible = true;

  // continue from last recipe
  Box box = Hive.box('recipex');

  // getters
  Base? get getBase => base;
  bool get getIsPasswordVisible {
    return _isPasswordVisible;
  }

  // setters
  set setBase(Base base) => this.base = base;
  set setHomePageIndex(int index) {
    homePageIndex = index;
    notifyListeners();
  }
  set setInput(String input) {
    this.input = input;
    notifyListeners();
  }
  set setCurrentPageIndex(int index){
    currentPageIndex = index;
    notifyListeners();
  }
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
}
