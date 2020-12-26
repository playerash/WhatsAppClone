import 'package:flutter/material.dart';

class FloatingButtonChamadas extends StatefulWidget {
  @override
  _FloatingButtonChamadasState createState() => _FloatingButtonChamadasState();
}

class _FloatingButtonChamadasState extends State<FloatingButtonChamadas> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: IconButton(
        onPressed: () {},
        color: Colors.white,
        icon: Icon(Icons.phone),
      ),
      onPressed: () {},
    );
  }
}
