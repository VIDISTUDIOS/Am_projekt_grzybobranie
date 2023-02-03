import 'package:flutter/material.dart';
import 'nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Grzybobranie'),
      ),
      drawer: NavBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Image.asset('lib/images/home_mushrooms.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: const Text(
              "Aplikacja Grzybobranie   Projekt  Aplikacje Mobilne ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Autorzy: Wiktor Sikora, Paweł Sacha, Bartosz Ryś, Mateusz Pacak ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.orange,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
