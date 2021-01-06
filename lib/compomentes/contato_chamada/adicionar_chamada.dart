import 'package:flutter/material.dart';

class AdicionarChamada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.group,
                      color: Colors.white,
                    ),
                    radius: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Nova chamada em grupo"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.person_add,
                      color: Colors.white,
                    ),
                    radius: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Novo contato"),
                  )
                ],
              ),
            ),
      ],
    );
  }
}
