import 'package:flutter/material.dart';

import '../classes/base.dart';

class MealListProvider with ChangeNotifier {

  Base? base;
  int homePageIndex = 0;
  String input = "";
  int currentPageIndex = 0;

  Base? get getBase => base;
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
}
