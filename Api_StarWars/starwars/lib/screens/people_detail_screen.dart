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
    final characterId = _extractIdFromUrl(widget.peopleItem.url!);

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'character_$characterId',
                  child: _buildCharacterImage(),
                ),
                const SizedBox(height: 20),
                _buildInfoRow('Name', widget.peopleItem.name!, Colors.white),
                _buildInfoRow('Height', widget.peopleItem.height!,
                    const Color.fromARGB(255, 201, 186, 55)),
                _buildInfoRow('Mass', widget.peopleItem.mass!,
                    const Color.fromARGB(255, 201, 186, 55)),
                _buildInfoRow('Hair Color', widget.peopleItem.hairColor!,
                    const Color.fromARGB(255, 201, 186, 55)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCharacterImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        'https://starwars-visualguide.com/assets/img/characters/${_extractIdFromUrl(widget.peopleItem.url!)}.jpg',
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) => const Icon(
          Icons.error,
          color: Colors.red,
          size: 100,
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: 'StarJedi',
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontFamily: 'StarJedi',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  String _extractIdFromUrl(String url) {
    final regex = RegExp(r'people/(\d+)/');
    final match = regex.firstMatch(url);
    return match?.group(1) ?? '0';
  }
}
