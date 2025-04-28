import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      'https://habittrackerbackend-production-9c1a.up.railway.app';

  Future loginPost() async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {'Content-Type': 'application'},
        // body: jsonEncode(),
      );
    } catch (e) {
      throw Exception('Error $e');
    }
  }
}
