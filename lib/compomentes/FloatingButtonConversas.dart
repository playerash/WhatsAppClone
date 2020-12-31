import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:WhatsAppClone/screens/floatingconversainterior.dart';
import 'package:flutter/material.dart';

class FloatingButtonConversas extends StatefulWidget {
  @override
  _FloatingButtonConversasState createState() =>
      _FloatingButtonConversasState();
}

class _FloatingButtonConversasState extends State<FloatingButtonConversas> {
   List<Contato> _contatos = [
    Contato("Ana", "images/ana.jpg"),
    Contato("And", "images/and.jpg"),
    Contato("Avatar", "images/avatar.jpg"),
    Contato("Buri", "images/saburi.jpg"),
    Contato("Nat", "images/nat.jpg"),
    Contato("Natan", "images/natan.jpg"),
    Contato("Vini", "images/vini.jpg"),
  ];
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child:Icon(Icons.chat, color: Colors.white,),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => BotaoConversa(_contatos)));
      },
    );
  }
}
