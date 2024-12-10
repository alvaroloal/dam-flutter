import 'package:flutter/material.dart';

class Listpage extends StatelessWidget {
  const Listpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color.fromARGB(255, 116, 114, 114)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            // header
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Best Iranian Actors and Actresses",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway'),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "March 2020",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // lista de actores horizontal
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: const [
                  ActorCard(
                    imageUrl:
                        'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/lbsd2lAIQq4egOUXDIfjhte12vv.jpg',
                    firstName: 'Golshifteh',
                    lastName: 'Farahani',
                  ),
                  ActorCard(
                    imageUrl:
                        'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/jQR1a4NH6dYPzCrrS22pJAMh8Ww.jpg',
                    firstName: 'Navid',
                    lastName: 'Mohammadzadeh',
                  ),
                  ActorCard(
                    imageUrl:
                        'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/iMDMsfjK00B9ZsswRFWfKPyXR9R.jpg',
                    firstName: 'Shahab',
                    lastName: 'Hosseini',
                  ),
                  ActorCard(
                    imageUrl:
                        'https://media.themoviedb.org/t/p/w300_and_h450_bestv2/gahTwww7GWWg1kZmLTfFB8XgSB1.jpg',
                    firstName: 'Saba',
                    lastName: 'Kamali',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //barra nav de abajo
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Booking",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "List",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class ActorCard extends StatelessWidget {
  final String imageUrl;
  final String firstName;
  final String lastName;

  const ActorCard({
    super.key,
    required this.imageUrl,
    required this.firstName,
    required this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Container(
              color: Colors.grey.shade200,
              child: Image.network(
                imageUrl,
                height: 300,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            firstName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            lastName,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
