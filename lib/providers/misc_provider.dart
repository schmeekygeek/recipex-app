import 'package:flutter/material.dart';

class MiscellaneousProvider with ChangeNotifier {
  
  bool _isPasswordVisible = true;
  int _homePageIndex = 0;
  String _password = '';

  bool get getIsPasswordVisible => _isPasswordVisible;
  int get getHomePageIndex => _homePageIndex;
  String get getPassword => _password;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
  set setHomePageIndex(int index) {
    _homePageIndex = index;
    notifyListeners();
  }
  void setPassword(String password) {
    _password = password;
  }
}
