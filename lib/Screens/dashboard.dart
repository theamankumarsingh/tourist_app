import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Widgets/carousel.dart';
import '../Utilities/constants.dart';

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
          children: [
            CarouselWithDotsPage(imgList: imgList),
          ],
        ),
      ),
    ));
  }
}
