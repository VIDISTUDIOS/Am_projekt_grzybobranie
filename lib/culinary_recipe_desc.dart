import 'package:flutter/material.dart';
import 'model/recipes.dart';


class CRpagedesc extends StatelessWidget  {
  final Recipe recipe;

  const CRpagedesc ({
    Key? key,
    required this.recipe,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) => Scaffold(
appBar: AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
    centerTitle: true, 
    title: const Text('Opis potrawy'),
  ),
  //drawer: NavBar(),
  backgroundColor: const Color.fromARGB(255, 33, 31, 31),
  body: SingleChildScrollView(
    child: Column(
      children: <Widget>[
        Image.network(
          recipe.picture,
          height: 400,
          width: double.infinity,
          fit: BoxFit.cover,
          ),
          const SizedBox(height: 16),
          Text(
            recipe.recipename,
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            recipe.description,
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