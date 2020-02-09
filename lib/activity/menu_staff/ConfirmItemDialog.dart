import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/activity/base/Buttons.dart';
import 'package:flutter_app/service/CameraService.dart';
import 'package:flutter_app/service/RandomContentService.dart';

class ConfirmItemDialog extends StatelessWidget {
  String uri;
  List<Widget> item_status = List<Widget>();

  ConfirmItemDialog({this.uri}) {}

  @override
  Widget build(BuildContext context) {
    item_status = [
      Text(
        "Detected!",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Text(uri),
      SizedBox(
        height: 30,
      ),
    ];

    if (RandomContentService().randomProbability(10)) {
      item_status.add(Text("Sorry, this bag is already scanned"));
    } else {
      item_status.addAll([
        Text("Do you want to pick this bag?"),
        PrimaryButton(
          child: Text(
            "I Pick This!",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return CameraServiceActivity(
                    camera: CameraDescription(
                  name: "Selfie",
                  lensDirection: CameraLensDirection.front,
                ));
              },
            ));
          },
        ),
        DangerButton(
          child: Text(
            "Cancel",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ]);
    }

    // TODO: implement build
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 1.0,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: item_status,
        ),
      ),
    );
  }
}
