import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 237, 238),
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            
            child: Image.asset("Assets/map.png"),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getCard("File an FIR", Icons.edit),
            getCard("Emergency Contact", Icons.call),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getCard("Compare Prices", Icons.monetization_on),
            getCard("What's poppin'?", Icons.question_answer)
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
                    color: Color(0xFFE4E4E4),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              height: 120,
              width: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Icon(
                      icon,
                      size: 50,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        label,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
