import 'package:flutter/material.dart';

class AppbarCodigoEnviado extends StatelessWidget {
  final String numeroTelefone;
  AppbarCodigoEnviado(this.numeroTelefone);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Confirmar $numeroTelefone",
        style: TextStyle(
          color: Color(0xFF075E54),
        ),
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
