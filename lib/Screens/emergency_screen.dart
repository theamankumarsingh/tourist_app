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
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('Assets/avatar.png'),
            ),
            title: const Text(
              'John Judah',
            ),
            subtitle: const Text('9804403207'),
            trailing: ElevatedButton(
                onPressed: () async {
                  await FlutterPhoneDirectCaller.callNumber("+9779804403207");
                },
                child: Icon(CupertinoIcons.phone)),
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
