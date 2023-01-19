import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class StorageProvider with ChangeNotifier {

  Box box = Hive.box('recipex');

  String? lastMealId = Hive.box('recipex').get('lastMealId');
  String rotd = Hive.box('recipex').get('rotdID') ?? "52858${DateTime.now().day}";

  String get getRotd => rotd;
  String? get getLastMealId => lastMealId;

  void setRotd(String rotd) {
    this.rotd = rotd;
    box.put('rotdID', rotd);
    notifyListeners();
  }

  void setLastMealId(String id) async {
    lastMealId = id;
    box.put('lastMealId', id);
    await Future.delayed(
      const Duration(milliseconds: 500),
      () => notifyListeners(),
    );
  }
}
