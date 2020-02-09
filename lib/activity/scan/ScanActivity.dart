import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/service/PermissionService.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScanActivity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScanPage();
  }
}

class _ScanPage extends State<ScanActivity>{
  var _result = "Hello World";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PermissionService().askPermission();
//    Future.delayed(Duration.zero,() async {
//      print("Begin Scan Photo");
//      String _scanResult = await scanner.scanPhoto();
//      setState(() {
//        print("Scan Photo done");
//        _result = _scanResult;
//      });
//    });
  }

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(
              child: Text(_result),
            ),
            FlatButton(
              child: Text("Scan"),
              onPressed: (){
                _scan();
              },
            )
          ],
        ),
      )
    );
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      setState(() {
        _result = barcode;
      });
    }
  }

}