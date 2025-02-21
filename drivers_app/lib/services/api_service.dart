import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService{
  final String baseUrl = 'http://server-ip/api';

  Future<dynamic> getOrders() async{
    final response = await  http.get(Uri.parse('$baseUrl/orders'));
    return json.decode(response.body);
  }
}