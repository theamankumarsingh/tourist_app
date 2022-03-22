import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class emergency extends StatefulWidget {
  const emergency({Key? key}) : super(key: key);

  @override
  State<emergency> createState() => _emergencyState();
}

class _emergencyState extends State<emergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Emergency Contacts"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView(children: [
        list_item("Aashray", '9804403207'),
        list_item('Aman', '9805441275')
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.doc_checkmark,
              color: Colors.red,
            ),
            label: 'FIR',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.text_bubble,
                color: Colors.blue,
              ),
              label: 'Emergency Message')
        ],
      ),
    );
  }
}

class list_item extends StatelessWidget {
  String name = "";
  String number = "";
  list_item(String name, String number) {
    this.name = name;
    this.number = number;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('Assets/avatar.png'),
            ),
            title: Text(
              this.name,
            ),
            subtitle: Text(this.number),
            trailing: ElevatedButton(
              onPressed: () async {
                await FlutterPhoneDirectCaller.callNumber(this.number);
              },
              child: Icon(CupertinoIcons.phone),
            ),
          ),
          const Divider(
            height: 1.0,
            indent: 1.0,
          ),
        ],
      ),
    );
  }
}
