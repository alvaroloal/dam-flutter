import 'dart:convert';
import 'package:http/http.dart' as http;

class TMDBService {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey = '330dac319c12144e2cfd7dfb4bfcb9fd';

  Future<List<dynamic>> fetchPopularMovies() async {
    final response =
        await http.get(Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['results'];
    } else {
      throw Exception('Error al cargar las películas populares');
    }
  }

  Future<List<dynamic>> fetchPopularActors() async {
    final response =
        await http.get(Uri.parse('$_baseUrl/person/popular?api_key=$_apiKey'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['results'];
    } else {
      throw Exception('Error al cargar los actores populares');
    }
  }
}
