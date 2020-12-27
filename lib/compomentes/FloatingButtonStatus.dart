import 'package:flutter/material.dart';

class FloatingButtonStatus extends StatefulWidget {
  @override
  _FloatingButtonStatusState createState() => _FloatingButtonStatusState();
}

class _FloatingButtonStatusState extends State<FloatingButtonStatus> {
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            width: size.width/9,
            height: size.height/9,
            child: FittedBox(
              child: FloatingActionButton(
                backgroundColor: Color(0xffeef5f6),
                child: Icon(
                  Icons.edit,
                  color: Color(0xff4f7477),
                  size: 30,
                ),
                onPressed: () {},
              ),
            ),
          ),
        FloatingActionButton(
          child: Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
