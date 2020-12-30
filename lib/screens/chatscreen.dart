import 'package:WhatsAppClone/compomentes/ConversaSelecinada.dart';
import 'package:WhatsAppClone/compomentes/PopUpMenuHome.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final ContatoConversa _contato;
  ChatScreen(this._contato);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 1,

        title: Row(
          children: [
            GestureDetector(
              child: Icon(
                Icons.arrow_back,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ConversaChat(widget._contato.imagem),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget._contato.nome),
                Text(
                  "visto por ultimo hoje ás...",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 19.0),
            child: Icon(Icons.videocam),
          ),
          Icon(Icons.phone),
          PopUpChat(),
        ],
      ),
      body: Stack(alignment: Alignment.bottomLeft, children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/backgroundwpp.png"),
                  fit: BoxFit.fill)),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: 285,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: 'Digite uma mensagem',
                            border: InputBorder.none),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF075E54),
              ),
              child: Icon(Icons.mic, color: Colors.white,),
            )
          ],
        ),
      ]),
    );
  }
}
