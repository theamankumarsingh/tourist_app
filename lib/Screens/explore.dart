import 'package:flutter/material.dart';
import '../Widgets/carousel.dart';
import '../Widgets/list_item.dart';
import '../classes/list_items.dart';
import '../Utilities/constants.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [CarouselWithDotsPage(imgList: imgList), list()],
      ),
    );
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
