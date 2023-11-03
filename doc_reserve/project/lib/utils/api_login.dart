import 'package:dio/dio.dart';

class ApiLogin {
  final Dio _dio = Dio();
  Future<bool> inputCheck(String username, String password) async {
    try {
      Response response =
          await _dio.get('https://651fca72906e276284c382db.mockapi.io/profile');
      print('Response data: ${response.data}');

      List<dynamic> users = response.data;
      var user = users.firstWhere(
          (user) =>
              user['username'].toString() == username &&
              user['password'].toString() == password,
          orElse: () => null);

      return user != null;
    } catch (error) {
      throw Exception('Failed to check input: $error');
    }
  }

  Future<bool> updateUser(
      String userId, String newUsername, String newPassword) async {
    try {
      Response response = await _dio.put(
        'https://651fca72906e276284c382db.mockapi.io/profile/1',
        data: {
          'username': newUsername,
          'password': newPassword,
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      throw Exception('Error updating user data: $error');
    }
  }

  Future<bool> createUser(String username, String password) async {
    try {
      final response = await _dio
          .post('https://651fca72906e276284c382db.mockapi.io/profile', data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      throw Exception('Failed to create user: $error');
    }
  }

  Future<bool> deleteUser(String username) async {
    final url = 'https://651fca72906e276284c382db.mockapi.io/profile/2';
    try {
      final dio = Dio();
      final response = await dio.delete(url);

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to delete user. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error deleting user: $e');
      return false;
    }
  }
}
