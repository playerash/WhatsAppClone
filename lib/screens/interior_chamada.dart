import 'package:WhatsAppClone/compomentes/divider_configurado.dart';
import 'package:WhatsAppClone/compomentes/interior_chamada/card_interior_chamada.dart';
import 'package:WhatsAppClone/compomentes/interior_chamada/info_interior_chamada.dart';
import 'package:WhatsAppClone/compomentes/interior_chamada/tipo_chamada.dart';
import 'package:WhatsAppClone/compomentes/pop_up_menu.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:flutter/material.dart';

class InteriorChamada extends StatefulWidget {
  final ContatoChamada _contato;
  InteriorChamada(this._contato);
  @override
  _InteriorChamadaState createState() => _InteriorChamadaState();
}

class _InteriorChamadaState extends State<InteriorChamada> {
  @override
  Widget build(BuildContext context) {
    //Definindo o tipo de chamada

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Dados da chamada",
          style: TextStyle(fontSize: 24),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 19.0),
            child: Icon(Icons.chat),
          ),
          PopUpChat(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardInteriorChamada(widget._contato),
          DividerConfigurado(),
          Padding(
            padding: const EdgeInsets.only(left: 60, top: 0, bottom: 30),
            child: Text(
              widget._contato.data,
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          InfoInteriorChamada(widget._contato),
        ],
      ),
    );
  }
}
