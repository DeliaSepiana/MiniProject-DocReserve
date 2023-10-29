import 'package:shared_preferences/shared_preferences.dart';

void saveCredentials(String username, String password) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('username', username);
  await prefs.setString('password', password);
}

Future<String> getUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('username') ?? '';
}

Future<String> getPassword() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('password') ?? '';
}
