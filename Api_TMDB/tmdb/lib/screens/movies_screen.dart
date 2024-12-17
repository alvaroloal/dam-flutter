import 'package:flutter/material.dart';
import '../services/tmdb_service.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final TMDBService _service = TMDBService();
  List<dynamic> _popularMovies = [];

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  void _fetchMovies() async {
    try {
      final movies = await _service.fetchPopularMovies();
      setState(() {
        _popularMovies = movies;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Peliculas',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ListView.builder(
        itemCount: _popularMovies.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              'https://image.tmdb.org/t/p/w500${_popularMovies[index]['poster_path']}',
              fit: BoxFit.cover,
            ),
            title: Text(_popularMovies[index]['title']),
            subtitle: Text('Rating: ${_popularMovies[index]['vote_average']}'),
          );
        },
      ),
    );
  }
}
