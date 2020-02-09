import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/activity/base/BaseState.dart';
import 'package:flutter_app/activity/base/Buttons.dart';
import 'package:flutter_app/activity/menu_staff/ConfirmItemDialog.dart';
import 'package:flutter_app/activity/menu_staff/CustomBottomBar.dart';
import 'package:flutter_app/activity/base/ItemPawn.dart';
import 'package:flutter_app/activity/menu_staff/MySliverAppBarStaff.dart';
import 'package:flutter_app/activity/scan/ScanActivity.dart';
import 'package:flutter_app/service/MyNavigation.dart';
import 'package:flutter_app/service/ScanService.dart';
import 'package:flutter_app/service/TakePictureScreen.dart';

class MenuStaffActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MenuStaffPage();
  }
}

class _MenuStaffPage extends BaseState<MenuStaffActivity> {
  bool is_shop_scanned = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        body: Material(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate: MySliverAppBarStaff(
                    expandedHeight: 300, is_shop_scanned: is_shop_scanned),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index == 0) {
                      return Text(
                        is_shop_scanned?"\nBag Collected\n":"\nNot yet collecting Bag\n",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      );
                    }
                    if(is_shop_scanned){
                      return ItemPawnComponent(
                        index: index,
                        data: ItemPawnModel(
                          title: "Bag #$index",
                          subtitle: "Status : Picked",
                          content: "Be carefull, Glass stuff",
                          thumbnail: "assets/images/bag.png"
                        ),
                      );
                    }else{
                      return null;
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Icon(Icons.camera),
          onPressed: () async{
            String result = await ScanService().scan();
            showDialog(context: context,child: ConfirmItemDialog(uri: result,),);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: FABBottomAppBar(
          notchedShape: CircularNotchedRectangle(),
          items: [
            FABBottomAppBarItem(
                iconData: is_shop_scanned ? Icons.close : Icons.store,
                text: is_shop_scanned ? "Leave Shop" : "Scan Shop QR"),
            FABBottomAppBarItem(iconData: Icons.settings, text: "Setting"),
          ],
          onTabSelected: (index) async {
            //Scan Shop QR
            if (index == 0) {
              if (!is_shop_scanned) {
//                String result = await ScanService().scan();
                setState(() {
                  is_shop_scanned = true;
                });
              } else {
                setState(() {
                  is_shop_scanned = false;
                });
              }
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
