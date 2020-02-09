import 'package:flutter/material.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

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

  MySliverAppBar({@required this.expandedHeight});

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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/doodle_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Opacity(
          opacity: shrinkOffset / expandedHeight > 0.9 ? 0 : 1 - (shrinkOffset / expandedHeight),
          child: Wrap(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(30),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Hi Manager, lets see what's happen now\n\nAssets",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "20M SGD",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Playfair',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Bags in Shop",
                                style: bag_title,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "120/230",
                                style: bag_number,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Couriers bring bags",
                                style: bag_title,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "20/30",
                                style: bag_number,
                                textAlign: TextAlign.center,
                              ),
                            ],
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
              "Hi Manager. have a nice day.",
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
