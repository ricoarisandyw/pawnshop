import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/activity/base/ItemPawn.dart';
import 'package:flutter_app/service/RandomContentService.dart';

class TeamActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TeamPage();
  }
}

class TeamPage extends State<TeamActivity> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Team List"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: ListView(
          children: List.generate(10, (index) {
            return ItemPawnComponent(
              index: index,
              data: ItemPawnModel(
                thumbnail: RandomContentService().randomPhoto(),
                content: "",
                title: RandomContentService().randomName(),
                subtitle: RandomContentService().randomNumber().toString() + " bags in hand",
              ),
              onTap: (){
                showDialog(context: context,child: AlertDialog(
                  title: Text("Do you want to take out his person?"),
                  actions: <Widget>[
                    FlatButton(onPressed: null, child: Text("Yes")),
                    FlatButton(onPressed: null, child: Text("Keep him"))
                  ],
                ));
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
