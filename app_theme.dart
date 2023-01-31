import 'package:flutter/material.dart';

class ApplicationTheme extends StatelessWidget {
  const ApplicationTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
     ),
        backgroundColor:const Color.fromARGB(255, 33, 31, 31),
        body: Center(

          child:Column(children:const [
SizedBox(height: 20),
        Padding(
            padding:  EdgeInsets.all(20.0),
            child: Text(
              "Motyw",
              textAlign: TextAlign.center,
              style:TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
              Text(
              "Light / Dark",
              textAlign: TextAlign.center,
              style:TextStyle(
                color: Color.fromARGB(255, 254, 254, 254),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
         SizedBox(
      height: 70,
      width: 300,
    child:ApplicationThemeExample(),
    ),

           
          ],
          ),
        ),
      );

  }
}

class ApplicationThemeExample extends StatefulWidget {
  const ApplicationThemeExample({super.key});

  @override
  State<ApplicationThemeExample> createState() => _ApplicationThemeExample();
}

class _ApplicationThemeExample extends State<ApplicationThemeExample> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: Colors.blue,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}
