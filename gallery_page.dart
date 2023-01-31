import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('Obejrzyj zdjęcie'),
        ),
        body: Container(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      image =
                          await picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        //update UI
                      });
                    },
                    child: Text("Wybierz zdjęcie")),
                image == null ? Container() : Image.file(File(image!.path))
              ],
            )));
  }
}
