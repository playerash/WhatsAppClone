import 'package:WhatsAppClone/compomentes/ConversaSelecinada.dart';
import 'package:WhatsAppClone/compomentes/PopUpMenuHome.dart';
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
    //define se a chamada foi de video ou não
    Widget _iconTipoChamada;
    if (widget._contato.iconTipoChamada == 0) {
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
    //define as chamadas recebidas
    Widget _iconChamada;
    if (widget._contato.iconChamada == 0) {
      _iconChamada = Icon(
        Icons.call_made,
        color: Colors.green,
        size: 16,
      );
    } else if (widget._contato.iconChamada == 1) {
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
    return Scaffold(
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
        body: Container(
          color: widget._contato.selecionado ? Color(0xfff2f2f2) : Colors.white,
          width: double.infinity,
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [ConversaNaoSelecionada(widget._contato.imagem),
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
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Row(children: [
                Icon(Icons.phone,color: Color(0xFF075E54)),
                Padding(
                  padding: const EdgeInsets.only(left:20.0,right: 5),
                  child: Icon(Icons.videocam, color: Color(0xFF075E54),),
                )
              ],)
            ],
          ),
        ));
  }
}
