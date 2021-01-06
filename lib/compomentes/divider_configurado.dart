import 'package:flutter/material.dart';

class DividerConfigurado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0,
      child: Padding(
        padding: const EdgeInsets.only(left: 60.0, right: 10),
        child: Divider(
          color: Colors.grey,
        ),
      ),
    );
  }
}
