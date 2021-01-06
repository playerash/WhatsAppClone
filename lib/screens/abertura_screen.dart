import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class AberturaScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  AberturaScreen(this.cameras);

  @override
  _AberturaScreenState createState() => _AberturaScreenState();
}

class _AberturaScreenState extends State<AberturaScreen> {
  @override
  void initState() {
    //Carregando a tela inicial por 3 segundos
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, "/home");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 100),
        width: double.infinity,
        child: Column(
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
      ),
    );
  }
}
