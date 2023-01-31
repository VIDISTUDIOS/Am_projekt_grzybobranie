import 'dart:convert';
import 'package:flutter/material.dart';
import 'model/recipes.dart';
import 'nav_bar.dart';
import 'culinary_recipe_desc.dart';

class CulinaryRecipes extends StatefulWidget{
  const CulinaryRecipes({super.key});
  @override
  State<CulinaryRecipes> createState() => CulinaryRecipesState();
 
}
class CulinaryRecipesState extends State<CulinaryRecipes>{
late Future<List<Recipe>> recipeFuture;
  @override
  void initState(){
   super.initState();
    recipeFuture = getRecipes(context);
  }
  static Future<List<Recipe>> getRecipes(BuildContext context) async{
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/recipes.json');
    final body = json.decode(data);
    return body.map<Recipe>(Recipe.fromJson).toList();
  }
      Widget buildMushrooms(List<Recipe> recipes) => ListView.builder(
       itemCount: recipes.length,
       itemBuilder: (context, index){
        final recipe = recipes[index];
        return Card(
          color: const Color.fromARGB(255, 33, 31, 31),
          
          child: ListTile(
          
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),//add border radius here
             child:  Image.network(recipe.picture,
             height: 300,
             width: 80,
             fit: BoxFit.fitWidth,),

            ),
            title: Text(
              style:const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              recipe.recipename),
           // subtitle: Text(
             // style:TextStyle(
             //   color: Colors.white,
             //   fontSize: 15,
             // ),
             // mushroom.description),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CRpagedesc(recipe: recipe),
              ));
            } ,
          ),
        );
       },   
    );

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
    centerTitle: true, 
    title: const Text('Grzybobranie'),
  ),
  drawer: NavBar(),
  backgroundColor: const  Color.fromARGB(255, 33, 31, 31),
  body: Center(
    child: FutureBuilder<List<Recipe>>(
     future: recipeFuture,
     builder: (context, snapshot) {
      if (snapshot.hasData)
      {
        final recipes = snapshot.data!;
       return buildMushrooms(recipes);
      }else{
        return const Text('No recipes data.');
      }
       
     },
     ),
  ),
    );


  }
}