import 'package:WhatsAppClone/compomentes/conversa_screen/card_conversa_screen.dart';
import 'package:WhatsAppClone/compomentes/divider_configurado.dart';
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
  int _selecionados = 0;
  _onTap(contato) {
    if (!contato.selecionado && _selecionados != 0) {
      print("teste");
      setState(
        () {
          _selecionados++;
          contato.selecionado = true;
        },
      );
    } else if (contato.selecionado) {
      print(contato.selecionado);
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
          builder: (_) => ChatScreen(contato),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...widget._contatos.map(
              (contato) {
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  // Selecão de conversas ou entrar na conversa
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
                      CardConversaScreen(contato),
                    ],
                  ),
                );
              },
            ),
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
