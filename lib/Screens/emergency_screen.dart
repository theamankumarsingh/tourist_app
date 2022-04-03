import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:location/location.dart';

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
          'Aman', '9023456781', const AssetImage('Assets/Contact_avatar.png')),
      Contact("Aashray", '9804403207', const AssetImage('Assets/avatar.png')),
      Contact("Chaithanya", "0123456789",
          const AssetImage('Assets/Contact_avatar.png'))
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0165ff),
        centerTitle: true,
        title: const Text(
          "Emergency Contacts",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(children: contacts),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () async {
                    Location location = new Location();

                    bool _serviceEnabled;
                    PermissionStatus _permissionGranted;
                    LocationData _locationData;

                    _serviceEnabled = await location.serviceEnabled();
                    if (!_serviceEnabled) {
                      _serviceEnabled = await location.requestService();
                      if (!_serviceEnabled) {
                        return;
                      }
                    }

                    _permissionGranted = await location.hasPermission();
                    if (_permissionGranted == PermissionStatus.denied) {
                      _permissionGranted = await location.requestPermission();
                      if (_permissionGranted != PermissionStatus.granted) {
                        return;
                      }
                    }

                    _locationData = await location.getLocation();
                    print("send msg");
                    LocationData ldata = await location.getLocation();
                    await sendSMS(
                        message:
                            "Help!!!\nI'm at ${ldata.latitude} latitude, ${ldata.longitude} longitude\nSee here: \nhttps://www.google.com/maps/search/?api=1&query=${ldata.latitude},${ldata.longitude}",
                        recipients: [number]);
                    print("sent msg");
                  },
                  icon: const Icon(
                    CupertinoIcons.chat_bubble_fill,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await FlutterPhoneDirectCaller.callNumber(number);
                  },
                  icon: const Icon(
                    CupertinoIcons.phone_fill,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
