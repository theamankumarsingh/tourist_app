import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_app/Screens/dashboard.dart';
import 'package:tourist_app/Screens/emergency_screen.dart';
import 'package:tourist_app/Screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourist_app/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ChangeNotifierProvider(
      child: MyApp(),
      create: (BuildContext context) =>
          ThemeProvider(isDarkMode: prefs.getBool("isDarkTheme") ?? false),
    ));
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  //ThemeMode _themeMode = ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
        title: 'Kavach',
        debugShowCheckedModeBanner: false,
        theme: themeProvider.getTheme,
        //   textTheme: GoogleFonts.latoTextTheme(
        //     Theme.of(context)
        //         .textTheme, // If this is not set, then ThemeData.light().textTheme is used.
        //   ),
        //   colorScheme: ColorScheme.fromSwatch(
        //     primarySwatch: Colors.blue,
        //   ).copyWith(
        //     brightness: Brightness.light,
        //     secondary: Colors.blueAccent,
        //   ),
        // ),
        // darkTheme: ThemeData(
        //   colorScheme: ColorScheme.fromSwatch(
        //     primarySwatch: Colors.purple,
        //   ).copyWith(
        //     brightness: Brightness.dark,
        //     secondary: Colors.purpleAccent,
        //   ),
        // ),
        // themeMode: _themeMode,
        home: Login(),
      );
    });
  }

  // void changeTheme(ThemeMode themeMode) {
  //   setState(() {
  //     _themeMode = themeMode;
  //   });
  // }
}
