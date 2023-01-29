import 'package:flutter/material.dart';
import 'nav_bar.dart';
import 'sound.dart';
import 'language.dart';
import 'app_theme.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
     ),
       drawer:const NavBar(),
      backgroundColor:const Color.fromARGB(255, 33, 31, 31),
      body: Center(child:
      Column( children:  [
       const SizedBox(height: 30),
       const Padding(
            padding:  EdgeInsets.all(20.0),
            child: Text(
              "Settings",
              textAlign: TextAlign.center,
              style:TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
 
         const SizedBox(height: 30),
    SizedBox(
      height: 70,
      width: 300,
    child:FloatingActionButton.extended(
      
  label:const Text(
              "Motyw",
              textAlign: TextAlign.center,
              style:TextStyle(
                color: Color.fromARGB(255, 254, 254, 254),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ), // <-- Text
  backgroundColor:const Color.fromARGB(255, 162, 22, 80),
  icon:const Icon( // <-- Icon
    Icons.brightness_6_rounded,
    size: 50.0,
  ),
  shape:const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
  onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) =>const ApplicationTheme()),
            );
  },
),
    ),
             const SizedBox(height: 30),
    SizedBox(
      height: 70,
      width: 300,
    child:FloatingActionButton.extended(
      
  label:const Text(
              "Język",
              textAlign: TextAlign.center,
              style:TextStyle(
                color: Color.fromARGB(255, 254, 254, 254),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ), // <-- Text
  backgroundColor:const Color.fromARGB(255, 162, 22, 80),
  icon:const Icon( // <-- Icon
    Icons.language_outlined,
    size: 50.0,
  ),
  shape:const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
  onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) =>const DropdownButtonApp()),
            );
  },
),
    ),
         const SizedBox(height: 30),
    SizedBox(
      height: 70,
      width: 300,
    child:FloatingActionButton.extended(
      
  label:const Text(
              "Dźwięki",
              textAlign: TextAlign.center,
              style:TextStyle(
                color: Color.fromARGB(255, 254, 254, 254),
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ), // <-- Text
  backgroundColor:const Color.fromARGB(255, 162, 22, 80),
  icon:const Icon( // <-- Icon
    Icons.volume_down_rounded,
    size: 50.0,
  ),
  shape:const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
  onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) =>const SoundPage()),
            );
            },
),
    ),
      ],

      ),
      ),
    );
  }
}