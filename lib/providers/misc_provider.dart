import 'package:flutter/material.dart';
import 'package:recipex_app/pages/dashboard.dart';

class MiscellaneousProvider with ChangeNotifier {
  
  String? _username;
  String? _password;
  bool _isPasswordVisible = true;
  Widget _homePageWidget = const Dashboard();

  String? get getUsername => _username;
  String? get getPassword => _password;
  bool get getIsPasswordVisible => _isPasswordVisible;
  Widget get getHomePage => _homePageWidget;

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
  set setHomePage(Widget homePage) {
    _homePageWidget = homePage;
    notifyListeners();
  }
}
