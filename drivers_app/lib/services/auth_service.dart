import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService{
  final String baseUrl = 'http://server-ip/api';

  Future<dynamic> login(String email, String password) async{
    final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers:{'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
    );
    return json.decode(response.body);
  }
}