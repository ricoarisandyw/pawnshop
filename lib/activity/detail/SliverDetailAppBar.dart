import 'package:flutter/material.dart';
import 'package:flutter_app/activity/base/ItemPawn.dart';

class MySliverAppBarDetail extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final String hero_tag;
  final ItemPawnModel selected_model;

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

  MySliverAppBarDetail({@required this.expandedHeight,this.hero_tag,this.selected_model});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Card(
          color: Colors.blue,
          margin: EdgeInsets.all(0),
          elevation: 5,
          child: Stack(
            children: <Widget>[
              Hero(
                tag: "$hero_tag",
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(this.selected_model.thumbnail),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.4,
                child: Container(
                  width: double.infinity,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        Opacity(
            opacity: 1 - (shrinkOffset / expandedHeight),
            child: Wrap(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        selected_model.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Playfair',
                        ),
                      ),
                      Text(
                        "Assets in this shop is 200K SGD",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      Text(
                        "Bags in this shop are 20",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        ),
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
              selected_model.title,
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