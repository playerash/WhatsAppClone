import 'package:flutter/material.dart';

class CardPerfilStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
            margin: EdgeInsets.all(0),
            elevation: 0,
            child: ListTile(
              //foto do perfil
              leading: Container(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("images/alyson.jpg"),
                      radius: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35, left: 40),
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).accentColor,
                        radius: 10,
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              title: Text(
                "Meu status",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Toque para atualizar seu status",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          );
  }
}