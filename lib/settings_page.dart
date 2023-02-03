import 'package:flutter/material.dart';
import 'nav_bar.dart';
import 'sound_page.dart';
import 'application_theme_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      drawer: NavBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: const Text(
                "Settings",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 70,
              width: 300,
              child: FloatingActionButton.extended(
                label: Text(
                  "Motyw",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 254, 254, 254),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // <-- Text
                backgroundColor: Color.fromARGB(255, 162, 22, 80),
                icon: Icon(
                  // <-- Icon
                  Icons.brightness_6_rounded,
                  size: 50.0,
                ),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ApplicationThemePage()),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 70,
              width: 300,
              child: FloatingActionButton.extended(
                label: Text(
                  "Dźwięki",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 254, 254, 254),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // <-- Text
                backgroundColor: Color.fromARGB(255, 162, 22, 80),
                icon: Icon(
                  // <-- Icon
                  Icons.volume_down_rounded,
                  size: 50.0,
                ),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SoundPage()),
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
