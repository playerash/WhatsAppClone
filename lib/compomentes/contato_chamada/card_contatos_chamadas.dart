import 'package:WhatsAppClone/compomentes/conversa_selecinada.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:flutter/material.dart';

class CardContatoChamada extends StatelessWidget {
  final ContatoChamada _contato;
  CardContatoChamada(this._contato);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8,
        left: 8,
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ConversaChat(_contato.imagem),
                Text(
                  _contato.nome,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Icon(
                      Icons.videocam,
                      color: Color(0xFF075E54),
                    ),
                  ),
                  Icon(
                    Icons.phone,
                    color: Color(0xFF075E54),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
