import 'package:flutter/material.dart';

class Mainmenuscreen extends StatefulWidget {
  const Mainmenuscreen({super.key});

  @override
  State<Mainmenuscreen> createState() => _MainmenuscreenState();
}

class _MainmenuscreenState extends State<Mainmenuscreen> {

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Movies',
    ),
  ];  

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


