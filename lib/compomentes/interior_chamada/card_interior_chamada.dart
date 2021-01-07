import 'package:WhatsAppClone/compomentes/conversa_selecinada.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:flutter/material.dart';

class CardInteriorChamada extends StatelessWidget {
  final ContatoChamada _contatoChamada;
  CardInteriorChamada(this._contatoChamada);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ConversaNaoSelecionada(_contatoChamada.imagem),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 22.0, left: 15, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _contatoChamada.nome,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Row(
                      children: [
                        Text(
                          "Olá, estou usando o WhatsApp",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.phone,
                color: Color(0xFF075E54),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 5),
                child: Icon(
                  Icons.videocam,
                  color: Color(0xFF075E54),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
