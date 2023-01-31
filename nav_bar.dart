import 'package:flutter/material.dart';
import 'package:grzybobranie/gallery.dart';
import 'atlas.dart';
import 'compass_page.dart';
import 'camera_page.dart';
import 'map_screen.dart';
import 'settings_screen.dart';
import 'homepage.dart';
import 'culinary_recipe.dart';
import 'package:camera/camera.dart';


class NavBar extends StatelessWidget {
  const NavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(

    //backgroundColor: Color.fromARGB(255, 33, 31, 31),
    child: ListView(
      
      padding: EdgeInsets.zero,
      children:  <Widget>[

        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),

        ListTile(
          leading: const Icon(Icons.message),
          title: const Text('Atlas grzybów'),
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MushroomAtlas()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.message),
          title:  const Text('Przepisy'),
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CulinaryRecipes()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.add_location),
          title: const Text('Mapa'),
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MapPage()),
           );
          },
        ),
        ListTile(
          leading: const Icon(Icons.photo_album),
          title: const Text('Galeria'),
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => RouteOne()),
           );
          },
        ),
        ListTile(
          leading:const Icon(Icons.photo_camera),
          title:const Text('Aparat'),
          onTap: () async {
            await availableCameras().then((value) => Navigator.push(context,
                MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
          }, 
        ),

        ListTile(
          leading:const Icon(Icons.compass_calibration_sharp),
          title:const Text('Kompas'),
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) =>const CompassPage()),
            );
          },
        ),

        ListTile(
          leading:const Icon(Icons.settings),
          title:const Text('Ustawienia'),
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) =>const SettingsScreen()),
            );
          },
        ),
      ],
    ),
  );
  }
}