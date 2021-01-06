import 'package:WhatsAppClone/compomentes/chamada_screen/icon_chamada.dart';
import 'package:WhatsAppClone/compomentes/conversa_selecinada.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:flutter/material.dart';

class CardChamada extends StatelessWidget {
  final ContatoChamada contatoChamada;
  CardChamada(this.contatoChamada);
  @override
  Widget build(BuildContext context) {
    //define se a chamada foi de video ou não
    Widget _iconTipoChamada = IconTipoChamada(contatoChamada);
    //define as chamadas recebidas
    Widget _iconChamada = IconChamada(contatoChamada);
    return Container(
      color: contatoChamada.selecionado ? Color(0xfff2f2f2) : Colors.white,
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          contatoChamada.selecionado
              ? ConversaSelecionada(contatoChamada.imagem)
              : ConversaNaoSelecionada(contatoChamada.imagem),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 22.0, left: 15, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contatoChamada.nome,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Row(
                      children: [
                        _iconChamada,
                        Text(
                          contatoChamada.data + contatoChamada.hora,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: _iconTipoChamada)
        ],
      ),
    );
  }
}
