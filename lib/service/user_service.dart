import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tokoto/constants.dart';
import 'package:tokoto/model/user.dart';
import 'package:tokoto/util/token.dart';

class UserService {
  Future<String> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        body: {"email": email, "password": password},
      );

      print(response.body);
      final String token = json.decode(response.body)['token'];
      return token;
    } catch (e) {
      throw "Email atau password yang anda input salah";
    }
  }

  Future<String> register(
    String firstName,
    String lastName,
    String email,
    String password,
    String phone,
    String address,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        body: {
          "first_name": firstName,
          "last_name": lastName,
          "address": address,
          "phone_number": phone,
          "email": email,
          "password": password
        },
      );
      final String token = json.decode(response.body)['message'];
      return token;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> logout() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/logout'),
      );
      return response.body;
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUser() async {
    try {
      print("objectId2");
      final response = await http.get(
        Uri.parse('$baseUrl/profile'),
        headers: {
          "Authorization": "Bearer $token",
        },
      );

      print(response.body);
      final User user = userFromJson(
        jsonEncode(json.decode(response.body)['data']),
      );
      return user;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
