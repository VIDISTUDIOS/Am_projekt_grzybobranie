import 'dart:convert';
import 'package:flutter/material.dart';
import 'model/mushroom.dart';
import 'nav_bar.dart';
import 'map_desc.dart';

class MushroomAtlas extends StatefulWidget{
  const MushroomAtlas({super.key});
  @override
  State<MushroomAtlas> createState() => MushroomAtlasState();
 
}
class MushroomAtlasState extends State<MushroomAtlas>{
late Future<List<Mushroom>> mushroomFuture;
  @override
  void initState(){
   super.initState();
    mushroomFuture = getMushrooms(context);
  }
  static Future<List<Mushroom>> getMushrooms(BuildContext context) async{
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/mushroom.json');
    final body = json.decode(data);
    return body.map<Mushroom>(Mushroom.fromJson).toList();
  }
      Widget buildMushrooms(List<Mushroom> mushrooms) => ListView.builder(
       itemCount: mushrooms.length,
       itemBuilder: (context, index){
        final mushroom = mushrooms[index];
        return Card(
          color: const Color.fromARGB(255, 33, 31, 31),
          
          child: ListTile(
          
            leading: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),//add border radius here
             child:  Image.network(mushroom.picture,
             height: 300,
             width: 80,
             fit: BoxFit.fitWidth,),

            ),
            title: Text(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              mushroom.mushroomname),
           // subtitle: Text(
             // style:TextStyle(
             //   color: Colors.white,
             //   fontSize: 15,
             // ),
             // mushroom.description),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MPageDescription(mushroom: mushroom),
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
  drawer:const NavBar(),
  backgroundColor: const Color.fromARGB(255, 33, 31, 31),
  body: Center(
    child: FutureBuilder<List<Mushroom>>(
     future: mushroomFuture,
     builder: (context, snapshot) {
      if (snapshot.hasData)
      {
        final mushrooms = snapshot.data!;
       return buildMushrooms(mushrooms);
      }else{
        return const Text('No mushroom data.');
      }
       
     },
     ),
  ),
    );


  }
}