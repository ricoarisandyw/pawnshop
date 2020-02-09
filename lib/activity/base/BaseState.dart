import 'package:flutter/material.dart';
import 'package:flutter_app/service/MyNavigation.dart';

class BaseState<T> extends State<StatefulWidget>{
  BuildContext _context;
  MyNavigation myNavigation;

  setContext(BuildContext context){
    _context = context;
  }

  void goto(Widget page){
    Navigator.push(_context, MaterialPageRoute(
      builder: (_context) => page
    ));
  }

  void showSnack(String message){
    Scaffold.of(context).showSnackBar(new SnackBar(
      content: new Text("Sending Message"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}