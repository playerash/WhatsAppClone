import 'package:WhatsAppClone/compomentes/divider_configurado.dart';
import 'package:WhatsAppClone/compomentes/status_screen/card_perfil_status.dart';
import 'package:WhatsAppClone/compomentes/status_screen/card_usuario_status.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:WhatsAppClone/screens/status_page_view.dart';
import 'package:flutter/material.dart';

class StatusScreen extends StatefulWidget {
  final List<ContatoStatus> _contatos;
  StatusScreen(this._contatos);
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff6f4f4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardPerfilStatus(),
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
                    ...widget._contatos.map(
                      (contato) {
                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => StatusPageView(contato),
                              ),
                            );
                          },
                          onLongPress: () {},
                          child: Column(
                            children: [
                              DividerConfigurado(),
                              CardContatoStatus(contato)
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
