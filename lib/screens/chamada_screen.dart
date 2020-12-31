import 'package:WhatsAppClone/compomentes/conversa_selecinada.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:WhatsAppClone/screens/interior_chamada.dart';
import 'package:flutter/material.dart';

class ChamadaScreen extends StatefulWidget {
  final List<ContatoChamada> _contatos;
  ChamadaScreen(this._contatos);
  @override
  _ChamadaScreenState createState() => _ChamadaScreenState();
}

class _ChamadaScreenState extends State<ChamadaScreen> {
  
  bool _umaChamadaSelecionada = false;
  int _selecionados = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...widget._contatos.map((contato) {
                  //define se a chamada foi de video ou não
                  Widget _iconTipoChamada;
                  if (contato.iconTipoChamada == 0) {
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
                  if (contato.iconChamada == 0) {
                    _iconChamada = Icon(
                      Icons.call_made,
                      color: Colors.green,
                      size: 16,
                    );
                  } else if (contato.iconChamada == 1) {
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
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      if (_umaChamadaSelecionada &&
                          !contato.selecionado &&
                          _selecionados != 0) {
                        setState(() {
                          _selecionados++;
                          contato.selecionado = true;
                        });
                      } else if (contato.selecionado &&
                          _umaChamadaSelecionada) {
                        setState(() {
                          _selecionados--;
                          contato.selecionado = false;
                        });
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => InteriorChamada(contato)));
                      }
                    },
                    onLongPress: () {
                      setState(() {
                        _selecionados++;
                        _umaChamadaSelecionada = true;
                        contato.selecionado = true;
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          color: contato.selecionado
                              ? Color(0xfff2f2f2)
                              : Colors.white,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(contato.nome,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17)),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 3.0),
                                        child: Row(
                                          children: [
                                            _iconChamada,
                                            Text(contato.data + contato.hora,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: _iconTipoChamada)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 60.0, right: 10),
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
          )),
    );
  }
}
