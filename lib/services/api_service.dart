import 'dart:convert';

import 'package:habit_tracker/models/signup_login_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      'https://habittrackerbackend-production-9c1a.up.railway.app';

  Future loginPost(SignupLoginModel data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data.toJson()),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed Log In');
      }
    } catch (e) {
      throw Exception('Error $e');
    }
  }

  Future signupPost(SignupLoginModel data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data.toJson()),
      );

      if (response.statusCode == 200) {
        print('Success Sign Up ${response.statusCode}');
        
      } else {
        final dataE = jsonDecode(response.body);
        throw Exception(dataE['error']);
      }
    } catch (e) {
      throw Exception('Error $e');
    }
  }
}
