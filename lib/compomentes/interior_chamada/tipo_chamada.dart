import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:flutter/material.dart';

class TextoTipoChamada extends StatelessWidget {
  final ContatoChamada _contatoChamada;
  TextoTipoChamada(this._contatoChamada);
  @override
  Widget build(BuildContext context) {
    String _textoChamada;
    if (_contatoChamada.iconChamada == 0) {
      _textoChamada = "Efetuada";
    } else if (_contatoChamada.iconChamada == 1) {
      _textoChamada = "Recebida";
    } else {
      _textoChamada = "Perdida";
    }
    return Text(
      _textoChamada,
      style: TextStyle(fontSize: 17),
    );
  }
}

class IconTipoChamadaInterior extends StatelessWidget {
  final ContatoChamada _contatoChamada;
  IconTipoChamadaInterior(this._contatoChamada);

  @override
  Widget build(BuildContext context) {
    Widget _iconChamada;
    if (_contatoChamada.iconChamada == 0) {
      _iconChamada = Icon(
        Icons.call_made,
        color: Colors.green,
        size: 25,
      );
    } else if (_contatoChamada.iconChamada == 1) {
      _iconChamada = Icon(
        Icons.call_received,
        color: Colors.green,
        size: 25,
      );
    } else {
      _iconChamada = Icon(
        Icons.call_received,
        color: Colors.red,
        size: 25,
      );
    }
    return _iconChamada;
  }
}
