import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../classes/meals.dart';

class StorageProvider with ChangeNotifier {

  Box box = Hive.box('recipex');

  // Last meal
  Meals? lastMeal = Hive.box('recipex').get('lastRec');

  Meals? get getLastMeal => lastMeal;

  void setLastMeal(Meals meal) async {
    lastMeal = meal;
    await Future.delayed(const Duration(seconds: 1), () => notifyListeners(),);
    // box.put('lastMeal', meal);
  }

  // Recipe of the day date
  int? rotd = Hive.box('recipex').get('rotdID');

  int? get getRotd => rotd;

  set setRotd(int rotd) {
    this.rotd = rotd;
    notifyListeners();
  }

  // Recipe of the day meal
  Meals? meal = Hive.box('recipex').get('rotd');

  Meals? get getRotdMeal => meal;

  set setRotdMeal(Meals meal){
    setRotdMeal = meal;
    notifyListeners();
  }

}
