import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tourist_app/Screens/emergency_screen.dart';
import 'package:tourist_app/Screens/feed.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: Text(
          "KAVACH",
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset("Assets/map.png"),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.bottomToTop,
                      duration: Duration(milliseconds: 600),
                      child: Dashboard(),
                    ),
                  );
                },
                child: getCard("File an FIR", Icons.edit_note_rounded)),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.bottomToTop,
                      duration: Duration(milliseconds: 600),
                      child: emergency(),
                    ),
                  );
                },
                child:
                    getCard("Emergency Contact", Icons.phone_android_rounded)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getCard("Compare Prices", Icons.monetization_on_rounded),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.bottomToTop,
                      duration: Duration(milliseconds: 600),
                      child: Feed(),
                    ),
                  );
                },
                child:
                    getCard("What's poppin'?", Icons.question_answer_rounded))
          ],
        )
      ]),
    );
  }

  Widget getCard(String label, IconData icon) {
    return Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Card(
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 192, 226, 255),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              height: 120,
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Icon(
                      icon,
                      color: Colors.blue,
                      size: 40,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        label,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
