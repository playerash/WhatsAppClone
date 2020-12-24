import 'package:WhatsAppClone/home.dart';
import 'package:WhatsAppClone/screens/splashscreen.dart';
import 'package:flutter/material.dart';

main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xFF075E54),
    ),
    darkTheme: ThemeData(brightness: Brightness.dark),
    //themeMode: ThemeMode.dark,
    home: Home()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
