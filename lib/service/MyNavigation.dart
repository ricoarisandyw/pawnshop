import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyNavigation{
  static Future to(BuildContext context,Widget page){
    return Navigator.push(context,
      MaterialPageRoute(
        builder: (context)=>page
      ),
    );
  }
}