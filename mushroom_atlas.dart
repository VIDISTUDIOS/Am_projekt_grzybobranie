import 'dart:convert';
import 'package:flutter/material.dart';
import 'model/mushroom.dart';
import 'nav_bar.dart';
import 'mushroom_description_page.dart';

class MushroomAtlas extends StatefulWidget {
  @override
  State<MushroomAtlas> createState() => _MushroomAtlasState();
}

class _MushroomAtlasState extends State<MushroomAtlas> {
  late Future<List<Mushroom>> mushroomFuture;

  @override
  void initState() {
    super.initState();
    mushroomFuture = getMushrooms(context);
  }

  static Future<List<Mushroom>> getMushrooms(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final data = await assetBundle.loadString('assets/mushroom.json');
    final body = json.decode(data);
    return body.map<Mushroom>(Mushroom.fromJson).toList();
  }

  Widget buildMushrooms(List<Mushroom> mushrooms) => ListView.builder(
        itemCount: mushrooms.length,
        itemBuilder: (context, index) {
          final mushroom = mushrooms[index];
          return Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //add border radius here
                child: Image.network(
                  mushroom.picture,
                  height: 300,
                  width: 80,
                  fit: BoxFit.fitWidth,
                ),
              ),
              title: Text(
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  mushroom.mushroomname),
              // subtitle: Text(
              // style:TextStyle(
              //   color: Colors.white,
              //   fontSize: 15,
              // ),
              // mushroom.description),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MushroomDescriptionPage(mushroom: mushroom),
                ));
              },
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('Grzybobranie'),
      ),
      drawer: NavBar(),
      body: Center(
        child: FutureBuilder<List<Mushroom>>(
          future: mushroomFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final mushrooms = snapshot.data!;
              return buildMushrooms(mushrooms);
            } else {
              return const Text('No mushroom data.');
            }
          },
        ),
      ),
    );
  }
}
