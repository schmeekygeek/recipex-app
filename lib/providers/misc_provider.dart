import 'package:flutter/material.dart';

class MiscellaneousProvider with ChangeNotifier {
  
  String? _username;
  String? _password;
  bool _isPasswordVisible = true;
  int _homePageIndex = 0;

  String? get getUsername => _username;
  String? get getPassword => _password;
  bool get getIsPasswordVisible => _isPasswordVisible;
  int get getHomePageIndex => _homePageIndex;

  set setUsername(String username) {
    _username = username;
  }
  set setPassword(String password) {
    _password = password;
  }
  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
  set setHomePageIndex(int index) {
    _homePageIndex = index;
    notifyListeners();
  }
}
