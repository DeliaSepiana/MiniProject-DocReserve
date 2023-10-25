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
    // Di sini, Anda bisa menambahkan logika autentikasi.
    // Contoh sederhana: membandingkan dengan nilai tetap.
    if (username == 'delia sepiana' && password == 'password123') {
      // Jika username dan password cocok, maka pengguna berhasil login.
      return true;
    } else {
      // Jika tidak cocok, pengguna gagal login.
      return false;
    }
  }
}
