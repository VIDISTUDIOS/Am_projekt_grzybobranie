import 'package:flutter/material.dart';
import 'model/mushroom.dart';

class MushroomDescriptionPage extends StatelessWidget {
  final Mushroom mushroom;

  const MushroomDescriptionPage({
    Key? key,
    required this.mushroom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text('Opis grzyba'),
        ),
        backgroundColor: const Color.fromARGB(255, 33, 31, 31),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(
                mushroom.picture,
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  mushroom.mushroomname,
                  style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  mushroom.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
