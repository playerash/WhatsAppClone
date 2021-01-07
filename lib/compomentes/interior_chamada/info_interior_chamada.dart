import 'package:WhatsAppClone/compomentes/interior_chamada/tipo_chamada.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:flutter/material.dart';

class InfoInteriorChamada extends StatelessWidget {
  final ContatoChamada _contatoChamada;
  InfoInteriorChamada(this._contatoChamada);
  @override
  Widget build(BuildContext context) {
    Widget _iconChamada = IconTipoChamadaInterior(_contatoChamada);
    Widget _textoChamada = TextoTipoChamada(_contatoChamada);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _iconChamada,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textoChamada,
            Text(
              _contatoChamada.hora,
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
        Text(
          "Chamada Recusada",
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
