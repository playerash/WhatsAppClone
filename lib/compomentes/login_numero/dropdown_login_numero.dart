import 'package:flutter/material.dart';

class DropdownLoginNumero extends StatelessWidget {
  final List<DropdownMenuItem<dynamic>> dropdown;
  DropdownLoginNumero(this.dropdown);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      child: DropdownButton(
        items: dropdown,
        hint: Center(
          child: Text("Brasil"),
        ),
        isExpanded: true,
      ),
    );
  }
}
