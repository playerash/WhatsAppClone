import 'package:WhatsAppClone/compomentes/conversa_selecinada.dart';
import 'package:WhatsAppClone/compomentes/pop_up_menu_home.dart';
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
    //define as chamadas recebidas
    String _textoChamada;
    Widget _iconChamada;
    if (widget._contato.iconChamada == 0) {
      _textoChamada = "Efetuada";
      _iconChamada = Icon(
        Icons.call_made,
        color: Colors.green,
        size: 25,
      );
    } else if (widget._contato.iconChamada == 1) {
      _textoChamada = "Recebida";
      _iconChamada = Icon(
        Icons.call_received,
        color: Colors.green,
        size: 25,
      );
    } else {
      _textoChamada = "Perdida";
      _iconChamada = Icon(
        Icons.call_received,
        color: Colors.red,
        size: 25,
      );
    }
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
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ConversaNaoSelecionada(widget._contato.imagem),
                  Expanded(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 22.0, left: 15, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget._contato.nome,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17)),
                          Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: Row(
                              children: [
                                Text("Olá, estou usando o WhatsApp",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Color(0xFF075E54)),
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 15),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, top: 0, bottom: 30),
              child: Text(
                widget._contato.data,
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _iconChamada,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_textoChamada, style: TextStyle(fontSize: 17),),
                    Text(widget._contato.hora, style: TextStyle(color: Colors.grey))
                  ],
                ),
                Text("Chamada Recusada", style: TextStyle(color: Colors.grey),)
              ],
            )
          ],
        ));
  }
}
