import 'package:WhatsAppClone/compomentes/conversa_selecinada.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:flutter/material.dart';

class CardContatoConversa extends StatelessWidget {
  final ContatoConversa _contato;
  CardContatoConversa(this._contato);
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
          children: [
            ConversaChat(_contato.imagem),
            Text(
              _contato.nome,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
