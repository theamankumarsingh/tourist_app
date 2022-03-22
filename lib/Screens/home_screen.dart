import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourist_app/Screens/emergency_screen.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => dashboard(),
        '/emergency': (context) => emergency()
      },
    );
  }
}

class dashboard extends StatelessWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shield"),
      ),
      body: Container(
        child: Text("Some Dash board Contnet"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          CupertinoIcons.shield,
          color: Colors.red,
        ),
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.of(context).pushNamed('/emergency');
        },
      ),
    );
  }
}
