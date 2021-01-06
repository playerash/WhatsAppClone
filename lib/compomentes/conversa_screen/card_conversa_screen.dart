import 'package:WhatsAppClone/compomentes/conversa_selecinada.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:flutter/material.dart';

class CardConversaScreen extends StatelessWidget {
  final ContatoConversa _contatoConversa;
  CardConversaScreen(this._contatoConversa);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: _contatoConversa.selecionado ? Color(0xfff2f2f2) : Colors.white,
      width: double.infinity,
      height: 82,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _contatoConversa.selecionado
              ? ConversaSelecionada(_contatoConversa.imagem)
              : ConversaNaoSelecionada(_contatoConversa.imagem),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 22.0, left: 15, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _contatoConversa.nome,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text(
                        _contatoConversa.data,
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.grey,
                          size: 16,
                        ),
                        Text(
                          _contatoConversa.mensagem,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
