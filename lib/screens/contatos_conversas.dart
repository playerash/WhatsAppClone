import 'package:WhatsAppClone/compomentes/ConversaSelecinada.dart';
import 'package:WhatsAppClone/compomentes/PopUpMenuHome.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:WhatsAppClone/screens/chatscreen.dart';
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
          children: [Text("Contatos"), Text(widget._contato.length.toString() + " contatos", style: TextStyle(fontSize: 13, color: Colors.grey[400],),)],
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
                    child: Icon(Icons.group, color: Colors.white,),
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
                    child: Icon(Icons.person_add, color: Colors.white,),
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
                  print(contato.selecionado);

                  if (_umaConversaSelecionada &&
                      !contato.selecionado &&
                      _selecionados != 0) {
                    print("teste");
                    setState(() {
                      _selecionados++;
                      contato.selecionado = true;
                    });
                  } else if (contato.selecionado && _umaConversaSelecionada) {
                    print(contato.selecionado);
                    setState(() {
                      _selecionados--;
                      contato.selecionado = false;
                    });
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ChatScreen(contato)));
                  }
                },
                onLongPress: () {
                  print(contato.selecionado);

                  setState(() {
                    _selecionados++;
                    _umaConversaSelecionada = true;
                    contato.selecionado = true;
                  });
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
