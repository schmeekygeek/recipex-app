import 'package:flutter/material.dart';

class MiscellaneousProvider with ChangeNotifier {
  
  String? _username;
  String? _password;

  String? get getUsername => _username;
  String? get getPassword => _password;

  set setUsername(String username) {
    _username = username;
  }
  set setPassword(String password) {
    _password = password;
  }
}
