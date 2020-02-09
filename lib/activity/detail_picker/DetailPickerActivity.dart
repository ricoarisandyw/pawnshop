import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/service/PermissionService.dart';
import 'package:flutter_app/service/RandomContentService.dart';
import 'package:geolocator/geolocator.dart';

class DetailPicker extends StatefulWidget {
  String imagePath;

  DetailPicker(String imagePath) {
    this.imagePath = imagePath;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailPickerPage(
      imagePath: imagePath,
    );
  }
}

class _DetailPickerPage extends State<DetailPicker> {
  String imagePath;
  bool is_from_camera = true;
  String myCoordinate = "loading . . .";

  _DetailPickerPage({Key key, this.imagePath}) {
    if (this.imagePath == null) {
      is_from_camera = false;
    }

    Future.delayed(Duration.zero, () async {
      PermissionService().askPermission();
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        myCoordinate =
            "\nLongitude : "+position.longitude.toString() + "\nLatitude : "+ position.latitude.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Bag')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Container(
        padding: EdgeInsets.only(top: 30),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(
              "Picker",
              style: TextStyle(
                fontSize: 28,
                fontFamily: "Playfair",
                fontWeight: FontWeight.bold,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: is_from_camera?Image.file(File(imagePath)):Image.asset(RandomContentService().randomPhoto()),
            ),
            Text(
              "Bag #1",
              style: TextStyle(
                fontSize: 28,
                fontFamily: "Playfair",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "picked by John",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "at : ${DateTime.now()}",
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "\nPhoto taked in " + myCoordinate,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
