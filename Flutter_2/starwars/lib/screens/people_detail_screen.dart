import 'package:flutter/material.dart';
import 'package:starwars/models/people_response/people.dart';

class PeopleDetailScreen extends StatelessWidget {
  final People person;

  const PeopleDetailScreen({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${person.name}', style: const TextStyle(fontSize: 18)),
            Text('Height: ${person.height}',
                style: const TextStyle(fontSize: 18)),
            Text('Mass: ${person.mass}', style: const TextStyle(fontSize: 18)),
            Text('Gender: ${person.gender}',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
