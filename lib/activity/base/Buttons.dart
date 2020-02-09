import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Button extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return null;
  }
}

class PrimaryButton extends Button{
  Widget child;
  Function onPressed;

  PrimaryButton({this.child,this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: RaisedButton(
        color: Colors.deepPurpleAccent,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(15),
         child: child,
        ),
      ),
    );
  }
}

class DangerButton extends Button{
  Widget child;
  Function onPressed;

  DangerButton({this.child,this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: RaisedButton(
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: child,
        ),
      ),
    );
  }
}