import 'package:flutter/material.dart';
import 'model/recipes.dart';

class RecipeDescriptionPage extends StatelessWidget {
  final Recipe recipe;

  const RecipeDescriptionPage({
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  recipe.recipename,
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
                  recipe.description,
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
