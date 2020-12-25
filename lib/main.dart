import 'package:WhatsAppClone/home.dart';
import 'package:WhatsAppClone/screens/splashscreen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras;
Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xFF075E54),
        buttonColor: Color(0xFF25D366)
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      //themeMode: ThemeMode.dark,
      home: Home(cameras)),
      
      );
}

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
