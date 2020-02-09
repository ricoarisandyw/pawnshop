import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseForm extends StatelessWidget{
  String hintText;
  TextEditingController controller;
  IconData icon;
  bool obscure;

  BaseForm({this.hintText,this.controller,this.icon,this.obscure}){
    if(this.obscure == null){
      this.obscure = false;
    }

    if(this.controller == null){
      this.controller = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 5,bottom:5),
        child:  TextField(
          style: TextStyle(
            color: Colors.blue,
          ),
          obscureText: this.obscure,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left:25,top:15,right:20,bottom:15),
            prefixIcon: Icon(icon),
            hintText: hintText,
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
            )
          ),
          controller: controller,
        ),
      ),
    );
  }
}