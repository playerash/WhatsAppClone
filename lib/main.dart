import 'package:WhatsAppClone/gerar_rotas.dart';
import 'package:WhatsAppClone/screens/abertura_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras; // para listar as cameras do celular
Future main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //usado quando tem algo além do runApp na main
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
            backgroundColor: Color(0xFF25D366),
          ),
        ),
        initialRoute: "/",
        onGenerateRoute: GerarRotas(cameras).geradorRotas,
        home: AberturaScreen(cameras)),
  );
}
