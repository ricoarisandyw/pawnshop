import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/activity/base/BaseState.dart';
import 'package:flutter_app/activity/base/Buttons.dart';
import 'package:flutter_app/activity/detail/DetailActivity.dart';
import 'package:flutter_app/activity/menu_staff/ConfirmItemDialog.dart';
import 'package:flutter_app/activity/menu_staff/CustomBottomBar.dart';
import 'package:flutter_app/activity/base/ItemPawn.dart';
import 'package:flutter_app/activity/scan/ScanActivity.dart';
import 'package:flutter_app/activity/team/TeamActivity.dart';
import 'package:flutter_app/service/MyNavigation.dart';
import 'package:flutter_app/service/RandomContentService.dart';
import 'package:flutter_app/service/ScanService.dart';
import 'package:flutter_app/service/TakePictureScreen.dart';

import 'MySliverAppBar.dart';

class MenuActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MenuPage();
  }
}

class _MenuPage extends BaseState<MenuActivity> {
  List<ItemPawnModel> items = List<ItemPawnModel>();

  _MenuPage(){
    String tag_identifier = "item_menu";
    items.add(ItemPawnModel(
      title: "Pawnshop #1",
      subtitle: "Becker Str. No 177",
      content: "Assets " + RandomContentService().randomNumber().toString() + "M SGD, " + RandomContentService().randomNumber().toString() + " Bags",
      thumbnail: "assets/images/shop_1.jpeg",
    ));
    items.add(ItemPawnModel(
      title: "Pawnshop #2",
      subtitle: "California No.88",
      content : "Assets " + RandomContentService().randomNumber().toString() + "M SGD, " + RandomContentService().randomNumber().toString() + " Bags",
      thumbnail: "assets/images/shop_2.jpeg",
    ));
    items.add(ItemPawnModel(
      title: "Pawnshop #3",
      subtitle: "Jakarta No. 20",
      content : "Assets " + RandomContentService().randomNumber().toString() + "M SGD, " + RandomContentService().randomNumber().toString() + " Bags",
      thumbnail: "assets/images/shop_3.jpeg",
    ));
    items.add(ItemPawnModel(
      title: "Pawnshop #4",
      subtitle: "Singapore City No. 2",
      content : "Assets " + RandomContentService().randomNumber().toString() + "M SGD, " + RandomContentService().randomNumber().toString() + " Bags",
      thumbnail: "assets/images/shop_4.jpeg",
    ));
    items.add(ItemPawnModel(
      title: "Pawnshop #5",
      subtitle: "Taj Mahal Street No. 3",
      content : "Assets " + RandomContentService().randomNumber().toString() + "M SGD, " + RandomContentService().randomNumber().toString() + " Bags",
      thumbnail: "assets/images/shop_1.jpeg",
    ));
    items.add(ItemPawnModel(
      title: "Pawnshop #6",
      subtitle: "Guang Zhou regency No. 9",
      content: "Assets " + RandomContentService().randomNumber().toString() + "M SGD, " + RandomContentService().randomNumber().toString() + " Bags",
      thumbnail: "assets/images/shop_2.jpeg",
    ));
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
                delegate: MySliverAppBar(expandedHeight: 300),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  items.map((item){
                    return ItemPawnComponent(
                      index: items.indexOf(item),
                      tag_identifier: "item_menu",
                      data: item,
                      onTap: (){
                        int idx = items.indexOf(item);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DetailActivity(
                              hero_tag: "item_menu$idx",selected_model: item,
                            )));
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.store_mall_directory),
              title: Text("Scan Shop QR")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.inbox),
                title: Text("Manage Bag")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_add),
                title: Text("Manage Courier"),
            ),
          ],
          onTap: (index){
            if(index == 0){
              ScanService().scan();
            } else if(index == 2){
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=>TeamActivity()
              ));
            }else{
              showSnack("Not Available");
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
