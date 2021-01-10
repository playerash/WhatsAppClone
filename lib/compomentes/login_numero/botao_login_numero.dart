import 'package:WhatsAppClone/screens/codigo_enviado.dart';
import 'package:flutter/material.dart';

class BotaoLoginNumero extends StatelessWidget {
  final String numeroTelefone;
  BotaoLoginNumero(this.numeroTelefone);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CodigoEnviado(numeroTelefone),
          ),
        );
      },
      child: Text(
        "AVANÇAR",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
