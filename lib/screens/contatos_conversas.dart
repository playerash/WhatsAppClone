import 'package:WhatsAppClone/compomentes/conversa_selecinada.dart';
import 'package:WhatsAppClone/compomentes/pop_up_menu_home.dart';
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
  bool _umaConversaSelecionada = false;
  int _selecionados = 0;
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
                    child: Text("Novo grupo"),
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
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ChatScreen(contato)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8,
                      left: 8,
                    ),
                    child: Container(
                      child: Row(
                        children: [
                          ConversaChat(contato.imagem),
                          Text(
                            contato.nome,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
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
