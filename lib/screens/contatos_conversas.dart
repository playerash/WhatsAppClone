import 'package:WhatsAppClone/compomentes/contato_conversa/adicionar_conversa.dart';
import 'package:WhatsAppClone/compomentes/contato_conversa/card_contatos_conversa.dart';
import 'package:WhatsAppClone/compomentes/pop_up_menu.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:WhatsAppClone/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class BotaoConversa extends StatefulWidget {
  final List<ContatoConversa> _contato;
  BotaoConversa(this._contato);
  @override
  _BotaoConversaState createState() => _BotaoConversaState();
}

class _BotaoConversaState extends State<BotaoConversa> {
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
            AdicionarConversa(),
            ...widget._contato.map(
              (contato) => GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(contato),
                    ),
                  );
                },
                child: CardContatoConversa(contato)
              ),
            )
          ],
        ),
      ),
    );
  }
}
