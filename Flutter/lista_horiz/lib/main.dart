import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
        ),
        body: const ActorList(),
      ),
    );
  }
}

class ActorList extends StatelessWidget {
  const ActorList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> actors = [
      {'name': 'Golshifteh Farahani', 'imagePath': 'assets/descarga.jpg'},
      {'name': 'Navid Mohammadzadeh', 'imagePath': 'assets/descarga(1).jpg'},
    ];

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: actors.length,
      itemBuilder: (context, index) {
        final actor = actors[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  actor['imagePath']!,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                actor['name']!,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
