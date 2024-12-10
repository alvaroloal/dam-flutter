import 'package:flutter/material.dart';

class Listpage extends StatelessWidget {
  const Listpage ({super.key});

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: ListView(
      key: GlobalKey(),
      scrollDirection: Axis.horizontal, // por defecto es vertical
      padding: const EdgeInsets.all(8.0),
      children: [
        // agregamos este espacio para que los widget empiecen abajo
        // del área de configuraciones del dispositivo
        const SizedBox(
          height: 50,
          width: 20,
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.network(
                  'https://i.pinimg.com/originals/fb/ca/ab/fbcaabb97bf76a5fbb9497553b4817b5.jpg',
                  height: 500,
                ),
              ),
              const Text('Lucas', style: TextStyle(fontSize: 30),),
              Text('Falla', style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.5)),),

            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.network(
                  'https://i.pinimg.com/originals/fb/ca/ab/fbcaabb97bf76a5fbb9497553b4817b5.jpg',
                  height: 500,
                ),
              ),
              const Text('David', style: TextStyle(fontSize: 30),),
              Text('Falla', style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.5)),),

            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(150),
                child: Image.network(
                  'https://i.pinimg.com/originals/fb/ca/ab/fbcaabb97bf76a5fbb9497553b4817b5.jpg',
                  height: 500,
                ),
              ),
              const Text('Alvaro', style: TextStyle(fontSize: 30),),
              Text('Castilla', style: TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.5)),),
            ],
          ),
        ),
      ],
    ),
  );
}
}