import 'package:WhatsAppClone/compomentes/conversa_selecinada.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:WhatsAppClone/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class ConversaScreen extends StatefulWidget {
  final List<ContatoConversa> _contatos;
  ConversaScreen(this._contatos);
  @override
  _ConversaScreenState createState() => _ConversaScreenState();
}

class _ConversaScreenState extends State<ConversaScreen> {
  

  bool _umaConversaSelecionada = false;
  int _selecionados = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...widget._contatos.map((contato) {
              return GestureDetector(
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 60.0, right: 10),
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      color: contato.selecionado
                          ? Color(0xfff2f2f2)
                          : Colors.white,
                      width: double.infinity,
                      height: 82,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          contato.selecionado
                              ? ConversaSelecionada(contato.imagem)
                              : ConversaNaoSelecionada(contato.imagem),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 22.0, left: 15, right: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(contato.nome,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17)),
                                      Text(
                                        contato.data,
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: Colors.grey,
                                          size: 16,
                                        ),
                                        Text(contato.mensagem,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Toque e segure uma conversa para mais opções",
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
