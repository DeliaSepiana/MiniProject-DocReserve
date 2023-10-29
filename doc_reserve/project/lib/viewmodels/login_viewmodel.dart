import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  String? username;
  String? password;

  void setUsername(String value) {
    username = value;
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    notifyListeners();
  }

  bool isValid() {
    return username != null &&
        username!.isNotEmpty &&
        password != null &&
        password!.isNotEmpty;
  }

  Future<bool> login() async {
    if (username == 'delia sepiana' && password == 'password123') {
      return true;
    } else {
      return false;
    }
  }
}
