import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../classes/list_items.dart';

Widget custom_list(NearbyList list_of_nearby) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      // ignore: unnecessary_new
      child: new FittedBox(
        child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: descrip_details(
                        list_of_nearby.title,
                        list_of_nearby.reviewsCount,
                        list_of_nearby.distance,
                        list_of_nearby.description),
                  ),
                ),
                Container(
                  width: 300,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(24.0),
                    child: Image(
                      fit: BoxFit.contain,
                      alignment: Alignment.topRight,
                      image: NetworkImage(list_of_nearby.imgUrl),
                    ),
                  ),
                ),
              ],
            )),
      ),
    ),
  );
}

Widget descrip_details(
    String title, String rating, String distance, String description) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        title,
        style: TextStyle(
            color: Colors.pinkAccent,
            fontSize: 24.0,
            fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              "($rating)",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
            Container(
              child: Icon(
                CupertinoIcons.add_circled,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                CupertinoIcons.add_circled,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                CupertinoIcons.add_circled,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                CupertinoIcons.add_circled,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                CupertinoIcons.add_circled,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
                child: Text(
              distance,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
          ],
        )),
      ),
      Container(
          child: Text(
        description,
        style: TextStyle(
            color: Colors.black54, fontSize: 18.0, fontWeight: FontWeight.bold),
      )),
    ],
  );
}
