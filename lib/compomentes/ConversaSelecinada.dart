import 'package:flutter/material.dart';

class ConversaNaoSelecionada extends StatelessWidget {
  final String perfil;
  ConversaNaoSelecionada(this.perfil);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(perfil),
      radius: 30,
    );
  }
}

class ConversaSelecionada extends StatelessWidget {
  final String perfil;
  ConversaSelecionada(this.perfil);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        CircleAvatar(
          backgroundImage: AssetImage(perfil),
          radius: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 35, left: 40),
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

class AppBarNaoSelecionada extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
