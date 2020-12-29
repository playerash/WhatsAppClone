import 'package:WhatsAppClone/home.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class AberturaScreen extends StatelessWidget {
  final List<CameraDescription> cameras;
  AberturaScreen(this.cameras);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 100),
        width: double.infinity,
        child: Stack(alignment: Alignment.center, children: [
          
          //utilizada para facilitar o uso de uma tela de abertura
          SplashScreen( 
            loaderColor: Colors.transparent,
            backgroundColor: Colors.white,
            seconds: 2,
            navigateAfterSeconds: Home(cameras),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(),
              Image.asset(
                "images/whatsapplogo.png",
                width: 100,
              ),
              FittedBox(),
              FittedBox(),
              Column(
                children: [
                  Text(
                    "from",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "FACEBOOK",
                    style: TextStyle(color: Colors.green, fontSize: 24),
                  ),
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
