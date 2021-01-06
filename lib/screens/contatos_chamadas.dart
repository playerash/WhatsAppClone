import 'package:WhatsAppClone/compomentes/contato_chamada/adicionar_chamada.dart';
import 'package:WhatsAppClone/compomentes/contato_chamada/card_contatos_chamadas.dart';
import 'package:WhatsAppClone/compomentes/pop_up_menu.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:flutter/material.dart';

class ListaChamada extends StatefulWidget {
  final List<ContatoChamada> _contato;
  ListaChamada(this._contato);
  @override
  _ListaChamadaState createState() => _ListaChamadaState();
}

class _ListaChamadaState extends State<ListaChamada> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Contatos"),
            Text(
              widget._contato.length.toString() + " contatos",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[400],
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          PopUpListaContatos(),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            AdicionarChamada(),
            ...widget._contato.map(
              (contato) => CardContatoChamada(contato)
            )
          ],
        ),
      ),
    );
  }
}
