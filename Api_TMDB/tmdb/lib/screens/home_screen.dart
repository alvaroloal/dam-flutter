import 'package:flutter/material.dart';
import '../services/tmdb_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TMDBService _service = TMDBService();
  List<dynamic> _popularActors = [];
  List<dynamic> _popularMovies = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    try {
      final actors = await _service.fetchPopularActors();
      final movies = await _service.fetchPopularMovies();
      setState(() {
        _popularActors = actors;
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
          'Inicio',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Películas Populares'),
            _buildHorizontalList(_popularMovies, 'title', true),
            _buildSectionTitle('Actores Populares'),
            _buildHorizontalList(_popularActors, 'name', false),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black87),
      ),
    );
  }

  Widget _buildHorizontalList(List<dynamic> items, String key, bool isMovie) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Container(
              width: 130,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${items[index]['poster_path'] ?? items[index]['profile_path']}',
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey,
                        height: 130,
                        child: const Icon(Icons.image_not_supported),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      items[index][key] ?? 'Desconocido',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
