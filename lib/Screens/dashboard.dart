import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourist_app/Screens/emergency_screen.dart';
import 'package:tourist_app/Widgets/list_item.dart';
import 'package:tourist_app/classes/list_items.dart';
import '../Widgets/carousel.dart';
import '../Utilities/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("KAVACH",
            style: GoogleFonts.cormorant(
                color: Colors.lightBlue, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [CarouselWithDotsPage(imgList: imgList), list()],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.lightBlue,
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 25),
          Icon(Icons.shop, size: 25),
          Icon(
            Icons.shield,
            size: 25,
            color: Colors.red,
          ),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    ));
  }
}

/// ----------------------------------- LIST ITEMS VIEW -------------------------
List<NearbyList> listItems = [
  NearbyList(
      title: "Lake Side",
      reviewsCount: "214",
      distance: "0.5 km",
      description: "Some Description",
      imgUrl:
          "https://pics.magicstay.com/photo-annonce-8K/HO/QG/K6/bien_msb_20210408140439_144113427.jpg"),
  NearbyList(
      title: "Mahadevshtan",
      reviewsCount: "115",
      distance: "1.5 km",
      description: "Some Description",
      imgUrl:
          "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/wat-rong-khun-or-white-temple-in-chiang-rai-royalty-free-image-1602774945.jpg?crop=1xw:1xh;center,top&resize=480:*")
];

Widget list() {
  return Container(
    child: Column(
      children: [
        SizedBox(
          height: 60,
        ),
        Text("Nearby Places"),
        Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: listItems.map((e) => custom_list(e)).toList(),
          ),
        )
      ],
    ),
  );
}
