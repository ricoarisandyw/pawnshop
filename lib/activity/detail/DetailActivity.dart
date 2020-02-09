import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/activity/base/BaseState.dart';
import 'package:flutter_app/activity/detail/SliverDetailAppBar.dart';
import 'package:flutter_app/activity/base/ItemPawn.dart';
import 'package:flutter_app/activity/detail_picker/DetailPickerActivity.dart';
import 'package:flutter_app/service/RandomContentService.dart';

class DetailActivity extends StatefulWidget{
  String hero_tag;
  ItemPawnModel selected_model;

  DetailActivity({this.hero_tag,this.selected_model});

  @override
  State<StatefulWidget> createState() {
    return _DetailPage(hero_tag,selected_model);
  }
}

class _DetailPage extends BaseState<DetailActivity>{
  String hero_tag;
  ItemPawnModel selected_model;

  _DetailPage(String hero_tag,ItemPawnModel selected_model){
    this.hero_tag = hero_tag;
    this.selected_model = selected_model;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Material(
          child: CustomScrollView(
            slivers: <Widget>[
              //======== LIST ITEM ========//
              SliverPersistentHeader(
                delegate: MySliverAppBarDetail(expandedHeight: 200,hero_tag: hero_tag, selected_model:selected_model),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, i) {
                        i = i+1;
                        ItemPawnModel bagPawn = ItemPawnModel(
                          title: "Bag #$i",
                          thumbnail: "assets/images/bag.png",
                          content: selected_model.content,
                          subtitle: "status : "+(RandomContentService().randomBool()? "Picked" : "In Shop"),
                        );
                    return ItemPawnComponent(index: i,tag_identifier: "item_detail",data: bagPawn,onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailPicker(null),
                      ));
                    },);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}