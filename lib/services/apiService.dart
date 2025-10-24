import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://127.0.0.1:5000';

  Future<List<dynamic>> getUsuarios() async {
    final res = await http.get(Uri.parse('$baseUrl/usuarios'));
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw Exception('Error al cargar usuarios');
    }
  }

  Future<List<dynamic>> getReportes() async {
    final res = await http.get(Uri.parse('$baseUrl/reportes'));
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw Exception('Error al cargar reportes');
    }
  }

  Future<List<dynamic>> getTips() async {
    final res = await http.get(Uri.parse('$baseUrl/tips'));
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw Exception('Error al cargar tips');
    }
  }
}
