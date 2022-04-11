import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:tourist_app/Screens/emergency_screen.dart';
import 'package:tourist_app/Screens/explore.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int current_index = 0;
  final screens = [
    Container(
      child: Text(
          "Yet to be coded , main dashboard. The designs are uploaded in github"),
    ),
    ExploreScreen(),
    Emergency()
  ];
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
      body: screens[current_index],
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
          setState(() {
            current_index = index;
          });
        },
      ),
    ));
  }
}
