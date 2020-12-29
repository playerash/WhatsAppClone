
import 'package:WhatsAppClone/home.dart';
import 'package:WhatsAppClone/screens/status_page_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class GerarRotas {
  List<CameraDescription> cameras;
  GerarRotas(this.cameras);
  Route<dynamic> geradorRotas(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => Home(cameras));
   
    }
  }
}
