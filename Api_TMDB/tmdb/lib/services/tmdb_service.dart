import 'dart:convert';
import 'package:http/http.dart' as http;

class TMDBService {
  static const String _baseUrl = 'https://api.themoviedb.org/3';
  static const String _apiKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1OTYyNzFmODUxYTlkZWEyNmVkNjM5ODgyMTIzZWJmMSIsIm5iZiI6MTczMTMxMzA5NS4yNDE5OTk5LCJzdWIiOiI2NzMxYmRjN2YzZWFmYzUyMDFmZDQwYTMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.UhzGsvUfhtxd5Tj9X4maTb2-m7iInID6XbtGMeJYTyg';

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
