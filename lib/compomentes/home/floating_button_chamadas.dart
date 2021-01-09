import 'package:WhatsAppClone/models/usuario.dart';
import 'package:flutter/material.dart';

class FloatingButtonChamadas extends StatefulWidget {
  @override
  _FloatingButtonChamadasState createState() => _FloatingButtonChamadasState();
}

class _FloatingButtonChamadasState extends State<FloatingButtonChamadas> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: size.width / 9,
          height: size.height / 9,
          child: FittedBox(
            child: FloatingActionButton(
              heroTag: "bnt1",
              backgroundColor: Color(0xffeef5f6),
              child: Icon(
                Icons.videocam,
                color: Color(0xff4f7477),
                size: size.width / 10,
              ),
              onPressed: () {
                print(usuario.numero);
                print(usuario.nome);
              },
            ),
          ),
        ),
        FloatingActionButton(
          heroTag: "bnt2",
          child: Icon(
            Icons.phone,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/contatos_chamada");
          },
        ),
      ],
    );
  }
}
