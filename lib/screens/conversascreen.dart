import 'package:WhatsAppClone/compomentes/ConversaSelecinada.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:flutter/material.dart';

class ConversaScreen extends StatefulWidget {
  @override
  _ConversaScreenState createState() => _ConversaScreenState();
}

class _ConversaScreenState extends State<ConversaScreen> {
  List<ContatoConversa> _contatos = [
    ContatoConversa("Buri", "images/saburi.jpg", "Eu te amo", "28/12/2020"),
    ContatoConversa("Ana", "images/ana.jpg", "Quando sai o rolê", "28/12/2020"),
    ContatoConversa(
        "Vini", "images/vini.jpg", "Compro outro jogo para mim?", "27/12/2020"),
    ContatoConversa(
        "Avatar", "images/avatar.jpg", "Cade meu ifood?", "26/12/2020"),
    ContatoConversa("Nat", "images/nat.jpg", "Superou seu ex?", "26/12/2020"),
    ContatoConversa("Natan", "images/natan.jpg", "Hackeia o insta dela ai man",
        "25/12/2020"),
    ContatoConversa(
        "And", "images/and.jpg", "Consertou a antena?", "23/12/2020"),
  ];

  bool _umaConversaSelecionada = false;
  int _selecionados = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ..._contatos.map((contato) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  print(contato.selecionado);

                  if (_umaConversaSelecionada && !contato.selecionado && _selecionados !=0) {
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
                    Container(
                      color: contato.selecionado ? Color(0xfff2f2f2): Colors.white,
                      width: double.infinity,
                      height: 70,
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
                    SizedBox(
                      height: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left:60.0, right: 10),
                        child: Divider(
       
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
      
    );
  }
}
