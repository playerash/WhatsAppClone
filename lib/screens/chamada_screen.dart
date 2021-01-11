import 'package:WhatsAppClone/compomentes/chamada_screen/card_chamada.dart';
import 'package:WhatsAppClone/compomentes/divider_configurado.dart';
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
  int _selecionados = 0;
  _onTap(contato) {
    if (!contato.selecionado && _selecionados != 0) {
      setState(
        () {
          _selecionados++;
          contato.selecionado = true;
        },
      );
    } else if (contato.selecionado) {
      setState(
        () {
          _selecionados--;
          contato.selecionado = false;
        },
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => InteriorChamada(contato),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...widget._contatos.map(
                (contato) {
                  return GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    //definições de seleção ou mudança de pagina
                    onTap: () {
                      _onTap(contato);
                    },
                    onLongPress: () {
                      setState(
                        () {
                          _selecionados++;
                          contato.selecionado = true;
                        },
                      );
                    },
                    child: Column(
                      children: [
                        DividerConfigurado(),
                        CardChamada(contato),  
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}