import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
