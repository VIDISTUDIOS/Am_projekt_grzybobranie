import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class ApplicationThemePage extends StatefulWidget {
  const ApplicationThemePage({Key? key}) : super(key: key);

  @override
  _ApplicationThemeStatePage createState() => _ApplicationThemeStatePage();
}

class _ApplicationThemeStatePage extends State<ApplicationThemePage> {
  bool _switchValue = false;

  @override
  void initState() {
    super.initState();
    loadSwitchValue();
  }

  void loadSwitchValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _switchValue = prefs.getBool('switchValue') ?? false;
    });
  }

  void saveSwitchValue(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('switchValue', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Light/Dark"),
          Switch(
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
                if (_switchValue)
                  MyApp.of(context)!.changeTheme(ThemeMode.dark);
                else
                  MyApp.of(context)!.changeTheme(ThemeMode.light);
              });
              saveSwitchValue(value);
            },
          ),
        ],
      )),
    );
  }
}
