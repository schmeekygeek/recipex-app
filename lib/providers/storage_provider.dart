import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class StorageProvider with ChangeNotifier {

  Box box = Hive.box('recipex');

  String? _lastMealId = Hive.box('recipex').get('lastMealId');
  String? _rotd = Hive.box('recipex').get('rotdID');

  String? get getRotd => _rotd;
  String? get getLastMealId => _lastMealId;


  set setRotd(String rotd) {
    _rotd = rotd;
    box.put('rotdID', rotd);
  }

  void setLastMealId(String id) async {
    _lastMealId = id;
    box.put('lastMealId', id);
    await Future.delayed(
      const Duration(milliseconds: 500),
      () => notifyListeners(),
    );
  }

}
