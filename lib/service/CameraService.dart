import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/activity/detail_picker/DetailPickerActivity.dart';
import 'package:geolocator/geolocator.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

// A screen that allows users to take a picture using a given camera.
class CameraServiceActivity extends StatefulWidget {
  final CameraDescription camera;

  const CameraServiceActivity({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  CameraServiceActivityState createState() => CameraServiceActivityState();
}

class CameraServiceActivityState extends State<CameraServiceActivity> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  bool isCameraReady = false;
  bool showCapturedPhoto = false;

  var ImagePath;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    CameraDescription front_camera;
    for (var i = 0; i < cameras.length; i++) {
      if (cameras[i].lensDirection == CameraLensDirection.front) {
        front_camera = cameras[i];
        break;
      }
    }

    _controller = CameraController(front_camera, ResolutionPreset.low);
    _initializeControllerFuture = _controller.initialize();
    if (!mounted) {
      return;
    }
    setState(() {
      isCameraReady = true;
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _controller != null
          ? _initializeControllerFuture = _controller.initialize()
          : null; //on pause camera is disposed, so we need to call again "issue is only for android"
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    // TODO: implement build
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          return Stack(
            children: <Widget>[
              Transform.scale(
                scale: _controller.value.aspectRatio / deviceRatio,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: CameraPreview(_controller), //cameraPreview
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                    margin: EdgeInsets.all(30),
                    child: Text(
                      "Please take selfie for proof",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(30),
                  child: FloatingActionButton(
                    onPressed: onCaptureButtonPressed,
                    backgroundColor: Colors.deepPurpleAccent,
                    child: Icon(Icons.camera),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Center(
              child:
                  CircularProgressIndicator()); // Otherwise, display a loading indicator.
        }
      },
    );
  }

  void onCaptureButtonPressed() async {
    //on camera button press
    try {
      final path = join(
        (await getTemporaryDirectory()).path, //Temporary path
        '${DateTime.now()}.png',
      );
      ImagePath = path;
      await _controller.takePicture(path); //take photo

      setState(() {
        showCapturedPhoto = true;
      });

      Navigator.of(context).pop();
      Navigator.of(context).push(MaterialPageRoute(
         builder: (context) => DetailPicker(ImagePath)
      ));
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
