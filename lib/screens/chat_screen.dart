import 'package:WhatsAppClone/compomentes/chat_screen/appbar_chat.dart';
import 'package:WhatsAppClone/compomentes/chat_screen/digitar_chat.dart';
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
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarChat(widget._contato)),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/backgroundwpp.png"),
                  fit: BoxFit.fill),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffdffec5)),
                child: Text(widget._contato.mensagem),
              ),
              DigitarChat(),
            ],
          ),
        ],
      ),
    );
  }
}
