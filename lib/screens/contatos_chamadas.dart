import 'package:WhatsAppClone/compomentes/ConversaSelecinada.dart';
import 'package:WhatsAppClone/compomentes/PopUpMenuHome.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:WhatsAppClone/screens/chatscreen.dart';
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
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopUpListaContatos(),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.group,
                      color: Colors.white,
                    ),
                    radius: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Nova chamada em grupo"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.person_add,
                      color: Colors.white,
                    ),
                    radius: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Novo contato"),
                  )
                ],
              ),
            ),
            ...widget._contato.map((contato) => GestureDetector(            
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8,
                      left: 8,
                    ),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ConversaChat(contato.imagem),
                              Text(
                                contato.nome,
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:20.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right:25.0),
                                  child: Icon(Icons.videocam, color: Color(0xFF075E54)),
                                ),
                                Icon(Icons.phone, color: Color(0xFF075E54)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
