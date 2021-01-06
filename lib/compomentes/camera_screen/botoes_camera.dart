import 'package:flutter/material.dart';

class BotoesCamera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Icon(
            Icons.flash_off,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () {},
        ),
        Container(
          height: size.width / 5,
          width: size.height / 5,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              shape: BoxShape.circle),
        ),
        IconButton(
          icon: Icon(
            Icons.switch_camera,
            color: Colors.white,
            size: 25,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
