import 'package:flutter/material.dart';

const List<String> list = <String>['Polski', 'Angielski', 'Włoski'];

class DropdownButtonApp extends StatelessWidget {
  const DropdownButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
  backgroundColor: Colors.transparent,
  elevation: 0,
    centerTitle: true, 
  ),
        backgroundColor: const Color.fromARGB(255, 33, 31, 31),
        body: Center(

          child:Column(children: const[
SizedBox(height: 20),
        Padding(
            padding:  EdgeInsets.all(20.0),
            child:  Text(
              "Język",
              textAlign: TextAlign.center,
              style:TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
      height: 70,
      width: 300,
    child:DropdownButtonExample(),
    ),

           
          ],
          ),
        ),
      );

  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 20,
      style: const TextStyle(color: Color.fromARGB(255, 162, 22, 80)),
      underline: Container(
        height: 2,
        color: const Color.fromARGB(255, 162, 22, 80),
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
