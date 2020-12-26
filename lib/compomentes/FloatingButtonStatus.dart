import 'package:flutter/material.dart';

class FloatingButtonStatus extends StatefulWidget {
  @override
  _FloatingButtonStatusState createState() => _FloatingButtonStatusState();
}

class _FloatingButtonStatusState extends State<FloatingButtonStatus> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: IconButton(
        onPressed: () {},
        color: Colors.white,
        icon: Icon(Icons.camera),
      ),
      onPressed: () {},
    );
  }
}
