import 'package:WhatsAppClone/compomentes/conversa_selecinada.dart';
import 'package:WhatsAppClone/compomentes/pop_up_menu_home.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:flutter/material.dart';

class AppBarChat extends StatelessWidget {
  final ContatoConversa _contato;
  AppBarChat(this._contato);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 1,
      title: Row(
        children: [
          GestureDetector(
            child: Icon(
              Icons.arrow_back,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ConversaChat(_contato.imagem),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_contato.nome),
              Text(
                "visto por ultimo hoje ás...",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 19.0),
          child: Icon(Icons.videocam),
        ),
        Icon(Icons.phone),
        PopUpChat(),
      ],
    );
  }
}
