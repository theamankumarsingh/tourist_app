import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Emergency extends StatefulWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  @override
  Widget build(BuildContext context) {
    List<Contact> contacts = [
      Contact(
        'Aman',
        '9805441275',
        const NetworkImage(
          'https://w7.pngwing.com/pngs/770/378/png-transparent-user-profile-icon-contact-information-s-face-head-avatar.png',
        ),
      ),
      Contact("Aashray", '9804403207', const AssetImage('Assets/avatar.png')),
      Contact(
          "Chaithanya",
          "0123456789",
          const NetworkImage(
              'https://w7.pngwing.com/pngs/770/378/png-transparent-user-profile-icon-contact-information-s-face-head-avatar.png'))
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Emergency Contacts"),
      ),
      body: ListView(children: contacts),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.camera,
              color: Colors.red,
            ),
            label: 'Go Live',
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

class Contact extends StatelessWidget {
  String name, number;
  ImageProvider? image;

  //constructor
  Contact(this.name, this.number, this.image);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(5)),
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              backgroundImage: image,
            ),
            title: Text(
              name,
            ),
            subtitle: Text(number),
            trailing: IconButton(
              onPressed: () async {
                await FlutterPhoneDirectCaller.callNumber(number);
              },
              icon: const Icon(
                CupertinoIcons.phone_fill,
                color: Colors.green,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
