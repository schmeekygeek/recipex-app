import 'package:flutter/material.dart';

class MiscellaneousProvider with ChangeNotifier {
  
  String? _username;
  String? _password;
  bool _isPasswordVisible = true;

  String? get getUsername => _username;
  String? get getPassword => _password;
  bool get getIsPasswordVisible => _isPasswordVisible;

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
}
