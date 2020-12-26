import 'package:flutter/material.dart';

class FloatingButtonConversas extends StatefulWidget {
  @override
  _FloatingButtonConversasState createState() => _FloatingButtonConversasState();
}

class _FloatingButtonConversasState extends State<FloatingButtonConversas> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: IconButton(
        onPressed: () {},
        color: Colors.white,
        icon: Icon(Icons.chat),
      ),
      onPressed: () {},
    );
  }
}
