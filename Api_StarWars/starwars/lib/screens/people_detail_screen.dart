import 'package:flutter/material.dart';
import 'package:starwars/models/people_response/people.dart';

class PeopleDetailScreen extends StatefulWidget {
  final People peopleItem;
  const PeopleDetailScreen({super.key, required this.peopleItem});

  @override
  State<PeopleDetailScreen> createState() => _PeopleDetailScreenState();
}

class _PeopleDetailScreenState extends State<PeopleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.peopleItem.name!.toLowerCase(),
          style: const TextStyle(
            color: Colors.yellow,
            fontFamily: 'StarJedi',
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFEDEDED),
              Color.fromARGB(255, 40, 10, 61),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    'https://starwars-visualguide.com/assets/img/characters/${_extractIdFromUrl(widget.peopleItem.url!)}.jpg',
                  ),
                ),
                Text(
                  'Name: ${widget.peopleItem.name}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'StarJedi',
                  ),
                ),
                Text(
                  'Height: ${widget.peopleItem.height}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 201, 186, 55),
                    fontFamily: 'StarJedi',
                  ),
                ),
                Text(
                  'Mass: ${widget.peopleItem.mass}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 201, 186, 55),
                    fontFamily: 'StarJedi',
                  ),
                ),
                Text(
                  'Hair Color: ${widget.peopleItem.hairColor}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 201, 186, 55),
                    fontFamily: 'StarJedi',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _extractIdFromUrl(String url) {
    final regex = RegExp(r'people/(\d+)/');
    final match = regex.firstMatch(url);
    return match!.group(1)!;
  }
}
