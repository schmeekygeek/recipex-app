import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class StorageProvider with ChangeNotifier {

  Box box = Hive.box('recipex');

  String? _lastMealId = Hive.box('recipex').get('lastMealId');
  String? _rotd = Hive.box('recipex').get('rotdID');
  late String? _jwt = Hive.box('recipex').get('jwt');

  String? get getRotd => _rotd;
  String? get getLastMealId => _lastMealId;
  String? get getJwt => _jwt;

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

  void setJwt(String jwt) async {
    _jwt = jwt;
    box.put('jwt', _jwt);
  }
}
