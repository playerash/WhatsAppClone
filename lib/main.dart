import 'package:WhatsAppClone/compomentes/pesquisa.dart';
import 'package:WhatsAppClone/home.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';



List<CameraDescription> cameras; // para listar as cameras do celular
Future main() async {
  WidgetsFlutterBinding.ensureInitialized(); //usado quando tem algo além do runApp na main
  cameras = await availableCameras(); // lista as cameras do celular
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Color(0xFF075E54),
            accentColor: Color(0xFF25D366),
            buttonTheme: ButtonThemeData(buttonColor: Color(0xFF25D366)),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Color(0xFF25D366))),
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
