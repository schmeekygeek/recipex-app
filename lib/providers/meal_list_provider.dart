import 'package:flutter/material.dart';

import '../classes/base.dart';

class MealListProvider with ChangeNotifier {

  Base? base;
  int pageIndex = 0;
  String input = "";

  Base? get getBase => base;
  set setBase(Base base) => this.base = base;

  set setIndex(int index) {
    pageIndex = index;
    notifyListeners();
  }

  set setInput(String input) {
    this.input = input;
    notifyListeners();
  }

}
