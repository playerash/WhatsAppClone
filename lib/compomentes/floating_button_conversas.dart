import 'package:flutter/material.dart';

class FloatingButtonConversas extends StatefulWidget {
  @override
  _FloatingButtonConversasState createState() =>
      _FloatingButtonConversasState();
}

class _FloatingButtonConversasState extends State<FloatingButtonConversas> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        Icons.chat,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pushNamed(context, "/contatos_conversa");
      },
    );
  }
}
