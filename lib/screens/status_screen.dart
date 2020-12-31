import 'package:WhatsAppClone/compomentes/conversa_selecinada.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:WhatsAppClone/screens/status_page_view.dart';
import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  List<ContatoStatus> _contatos = [
    ContatoStatus(
        "Buri", "images/saburi.jpg", ["images/teste.jpg", "images/vini.jpg"], "Há 9 minutos")
  ];
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff6f4f4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            margin: EdgeInsets.all(0),
            elevation: 0,
            child: ListTile(
              //foto do perfil
              leading: Container(
                child: Stack(children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("images/alyson.jpg"),
                    radius: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 40),
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).accentColor,
                      radius: 10,
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
              ),

              title: Text(
                "Meu status",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Toque para atualizar seu status",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              "Atualizações recentes",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ..._contatos.map((contato) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => StatusPageView(contato)));
                      },
                      onLongPress: () {},
                      child: Column(
                        children: [
                          SizedBox(
                            height: 0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 60.0, right: 10),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            width: double.infinity,
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                ConversaNaoSelecionada(contato
                                    .imagens[contato.imagens.length - 1]),
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
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 3.0),
                                          child: Row(
                                            children: [
                                              Text(contato.hora,
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
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
