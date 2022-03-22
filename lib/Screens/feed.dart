import 'package:flutter/material.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List<String> titles = [
    "Robbery at the junction",
    "Pickpocketing at an abandoned area",
    "A group of suspicious people"
  ];
  List<String> subtitles = [
    "Robbery at the junction",
    "Pickpocketing at an abandoned area",
    "A group of suspicious people"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Live updates around you", style: TextStyle(color: Colors.black),),
        ),
        body: ListView.builder(
          itemBuilder: (BuildContext context, index) {
            return Card(
              child: ListTile(
                trailing: Icon(Icons.arrow_right_rounded),
                title: Text(titles[index]),
                subtitle: Text(subtitles[index]),
              ),
            );
          },
          itemCount: titles.length,
          shrinkWrap: true,
          padding: EdgeInsets.all(5),
          scrollDirection: Axis.vertical,
        ));
  }
}
