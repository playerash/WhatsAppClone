import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:flutter/material.dart';

class IconTipoChamada extends StatelessWidget {
  final ContatoChamada contatoChamada;
  IconTipoChamada(this.contatoChamada);

  @override
  Widget build(BuildContext context) {
    Widget _iconTipoChamada;
    if (contatoChamada.iconTipoChamada == 0) {
      _iconTipoChamada = Icon(
        Icons.videocam,
        color: Color(0xFF075E54),
      );
    } else {
      _iconTipoChamada = Icon(
        Icons.phone,
        color: Color(0xFF075E54),
      );
    }
    return _iconTipoChamada;
  }
}

class IconChamada extends StatelessWidget {
  final ContatoChamada contatoChamada;
  IconChamada(this.contatoChamada);
  @override
  Widget build(BuildContext context) {
    Widget _iconChamada;
    if (contatoChamada.iconChamada == 0) {
      _iconChamada = Icon(
        Icons.call_made,
        color: Colors.green,
        size: 16,
      );
    } else if (contatoChamada.iconChamada == 1) {
      _iconChamada = Icon(
        Icons.call_received,
        color: Colors.green,
        size: 16,
      );
    } else {
      _iconChamada = Icon(
        Icons.call_received,
        color: Colors.red,
        size: 16,
      );
    }
    return _iconChamada;
  }
}
