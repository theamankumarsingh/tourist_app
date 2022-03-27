import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tourist_app/Screens/dashboard.dart';

import 'package:page_transition/page_transition.dart';

class Login extends StatefulWidget {
  var photos = [
    'Assets/Traveling-rafiki.png',
    'Assets/Ahmedabad-rafiki.png',
    'Assets/Agra-rafiki.png',
    'Assets/Tour guide-rafiki.png'
  ];

  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FocusNode focusEmail = FocusNode();
  FocusNode focusPass = FocusNode();

  int _image = 0;
  var _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 7), (Timer t) {
      setState(() {
        _image = (_image + 1) % widget.photos.length;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {});
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(
                  left: 45, right: 45, top: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      widthFactor: 0.85,
                      child: slideshow()),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Welcome to Kavach!',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 28,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      'Please login to stay protected.',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextField(
                      onTap: () {
                        setState(() {});
                      },
                      focusNode: focusEmail,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        )),
                        prefixIcon: Icon(
                          Icons.alternate_email,
                          color: focusEmail.hasFocus
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade400,
                        ),
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: TextField(
                      onTap: () {
                        setState(() {});
                      },
                      focusNode: focusPass,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        )),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: focusPass.hasFocus
                              ? Theme.of(context).primaryColor
                              : Colors.grey.shade400,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.help,
                            color: Theme.of(context).primaryColor,
                          ),
                          onPressed: () {},
                        ),
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.bottomToTop,
                            duration: Duration(milliseconds: 600),
                            child: dashboard(),
                          ),
                        );
                      },
                      child: const Text('Login'),
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff0165ff)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ))),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New User?',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff0165ff),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  //fix
  Widget slideshow() {
    var prev = _image - 1;
    if (_image == 0) {
      prev = 3;
    }
    setState(() {});
    return Stack(children: [
      AnimatedOpacity(
          opacity: 0,
          duration: const Duration(milliseconds: 1000),
          child: Image.asset(widget.photos[prev])),
      AnimatedOpacity(
          opacity: 1,
          duration: const Duration(milliseconds: 1000),
          child: Image.asset(widget.photos[_image]))
    ]);
  }
}
