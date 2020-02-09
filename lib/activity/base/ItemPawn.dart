import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/activity/detail/DetailActivity.dart';
import 'package:flutter_app/service/Usefull.dart';

class ItemPawnComponent extends StatelessWidget {
  ItemPawnModel data;
  int index;
  String tag_identifier;
  Function onTap;

  ItemPawnComponent(
      {this.data, @required this.index, @required this.tag_identifier,this.onTap}) {
    if (this.data == null) {
      this.data = ItemPawnModel(
        title: "Title is empty",
        subtitle: "Subtitle is empty",
        content: "Content is empty",
        thumbnail: "assets/images/shop_1.jpeg",
      );
    }

    if(this.onTap == null){
      this.onTap = (){};
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: GestureDetector(
          onTap: () {
            onTap();
          },
          child: Card(
            elevation: 7,
            child: Container(
              child: Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
                child: Row(
                  children: <Widget>[
                    Hero(
                      tag: "$tag_identifier$index",
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(data.thumbnail),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10, top: 10, bottom: 10, right: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
//                            mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
//                              Text(
//                                this.data.title,
//                                style: TextStyle(
//                                    fontSize: 24, fontFamily: 'Playfair'),
//                              ),
                                Flexible(
                                  child: Text(this.data.title,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Playfair')),
                                ),
                                Flexible(
                                  child: Text(
                                    this.data.subtitle,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        fontFamily: 'Montserrat'),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      this.data.content,
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: false,
                                      maxLines: 3,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
//                              Text(
//                                this.data.content,
//                                overflow: TextOverflow.ellipsis,
//                                style: TextStyle(
//                                    fontSize: 12, fontFamily: 'Montserrat'),
//                              ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class ItemPawnModel {
  String title;
  String subtitle;
  String content;
  String thumbnail;

  ItemPawnModel({this.title, this.subtitle, this.content, this.thumbnail});
}
