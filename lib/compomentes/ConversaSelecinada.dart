import 'package:flutter/material.dart';

class ConversaNaoSelecionada extends StatelessWidget {
  final String perfil;
  ConversaNaoSelecionada(this.perfil);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 10),
      child: Stack(
            children:[ CircleAvatar(
          backgroundImage: AssetImage(perfil),
          radius: 25,
        ),]
      ),
    );
  }
}


class ConversaChat extends StatelessWidget {
  final String perfil;
  ConversaChat(this.perfil);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      child: Stack(
            children:[ CircleAvatar(
          backgroundImage: AssetImage(perfil),
          radius: 20,
        ),]
      ),
    );
  }
}

class ConversaSelecionada extends StatelessWidget {
  final String perfil;
  ConversaSelecionada(this.perfil);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, left: 10),
      child: Stack(children: [
        CircleAvatar(
          backgroundImage: AssetImage(perfil),
          radius: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35, left: 30),
          child: CircleAvatar(
            backgroundColor: Color(0xFF075E54),
            radius: 10,
            child: Icon(
              Icons.check,
              size: 15,
              color: Colors.white,
            ),
          ),
        )
      ]),
    );
  }
}

