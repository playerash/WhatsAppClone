import 'package:flutter/material.dart';

class FlatButtonReenviar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Row(
        children: [
          Icon(
            Icons.chat,
            color: Color(0xFF075E54),
          ),
          Text(
            "Reenviar SMS",
            style: TextStyle(
              color: Color(0xFF075E54),
            ),
          ),
        ],
      ),
    );
  }
}
