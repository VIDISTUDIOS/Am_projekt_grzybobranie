import 'package:flutter/material.dart';
import 'model/mushroom.dart';


class MPageDescription extends StatelessWidget  {
  final Mushroom mushroom;

  const MPageDescription ({
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
  //drawer: NavBar(),
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
          Text(
            mushroom.mushroomname,
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            mushroom.description,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
      ],
    ),
  ),
  );
}