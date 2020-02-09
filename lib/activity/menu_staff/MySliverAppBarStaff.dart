import 'package:flutter/material.dart';
import 'package:flutter_app/activity/base/Buttons.dart';
import 'package:flutter_app/activity/team/TeamActivity.dart';
import 'package:flutter_app/service/ScanService.dart';

class MySliverAppBarStaff extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  bool is_shop_scanned;
  int team_size = 7;

  TextStyle bag_title = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontFamily: 'Montserrat',
  );

  TextStyle bag_number = TextStyle(
    fontSize: 36,
    color: Colors.white,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
  );

  MySliverAppBarStaff({@required this.expandedHeight,this.is_shop_scanned});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Card(
          color: Colors.deepPurple,
          margin: EdgeInsets.all(0),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
        ),
        Opacity(
            opacity: 1 - (shrinkOffset / expandedHeight),
            child: Wrap(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      is_shop_scanned? Text(
                        "Hi Staff, you are now at",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ):Text(
                        "Hi Staff,\n you can Scan a Shop for begin",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      is_shop_scanned?Text(
                        "PawnShop 1#",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Playfair',
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ):SizedBox(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: is_shop_scanned?[
                                Text(
                                  "Bag collected by team",
                                  style: bag_title,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "20",
                                  style: bag_number,
                                  textAlign: TextAlign.center,
                                ),
                              ]:[],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: is_shop_scanned?[
                                Text(
                                  "Bag collected by you",
                                  style: bag_title,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "20",
                                  style: bag_number,
                                  textAlign: TextAlign.center,
                                ),
                              ]:[],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: is_shop_scanned?[
                                PrimaryButton(
                                  child:Text("-",style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
                                  onPressed: (){
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context)=>TeamActivity()
                                    ));
                                  },
                                ),
                              ]:[],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: is_shop_scanned?[
                                Text(
                                  "Team",
                                  style: bag_title,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  team_size.toString(),
                                  style: bag_number,
                                  textAlign: TextAlign.center,
                                ),
                              ]:[],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: is_shop_scanned?[
                                PrimaryButton(
                                  child:Text("+",style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
                                  onPressed: () async{
                                    await ScanService().scan();
                                  },
                                ),
                              ]:[],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "Hi, Staff. have a nice day.",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: 'Montserrat'),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}