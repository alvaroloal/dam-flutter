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
      appBar: AppBar(title: const Text('Inicio')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Popular Movies'),
            _buildHorizontalList(_popularMovies, 'title'),
            _buildSectionTitle('Popular Actors'),
            _buildHorizontalList(_popularActors, 'name'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildHorizontalList(List<dynamic> items, String key) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.grey,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${items[index]['poster_path'] ?? items[index]['profile_path']}',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Text(items[index][key] ?? 'Unknown',
                    textAlign: TextAlign.center),
              ],
            ),
          );
        },
      ),
    );
  }
}
