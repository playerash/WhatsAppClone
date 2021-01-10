import 'package:flutter/material.dart';

class AppBarLoginNumero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          "Insira seu número de telefone",
          style: TextStyle(color: Color(0xFF075E54)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Icon(
            Icons.more_vert,
            color: Color(0xFF075E54),
          ),
        ],
      );
  }
}