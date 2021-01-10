import 'package:flutter/material.dart';

class FlatButtonMeLigue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Row(
        children: [
          Icon(
            Icons.phone,
            color: Color(0xFF075E54),
          ),
          Text(
            "Me ligue",
            style: TextStyle(
              color: Color(0xFF075E54),
            ),
          ),
        ],
      ),
    );
  }
}
