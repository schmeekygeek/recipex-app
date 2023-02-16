import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class StorageProvider with ChangeNotifier {

  Box box = Hive.box('recipex');

  String? lastMealId = Hive.box('recipex').get('lastMealId');
  String? rotd = Hive.box('recipex').get('rotdID');
  bool isFirstTime = Hive.box('recipex').get('isFirstTime') ?? true;
  String? jwt = Hive.box('recipex').get('jwt');

  String? get getRotd => rotd;
  String? get getLastMealId => lastMealId;
  bool get getIsFirstTime => isFirstTime;
  String? get getJwt => jwt;

  void setRotd(String rotd) {
    this.rotd = rotd;
    box.put('rotdID', rotd);
  }

  void setLastMealId(String id) async {
    lastMealId = id;
    box.put('lastMealId', id);
    await Future.delayed(
      const Duration(milliseconds: 500),
      () => notifyListeners(),
    );
  }

  void toggleFirstTime() {
    isFirstTime = !isFirstTime;
    box.put('isFirstTime', isFirstTime);
  }
}
