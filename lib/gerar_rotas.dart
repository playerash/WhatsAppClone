import 'package:WhatsAppClone/home.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'compomentes/mocks.dart' as mocks;
import 'package:WhatsAppClone/screens/camera_screen.dart';
import 'package:WhatsAppClone/screens/contatos_chamadas.dart';
import 'package:WhatsAppClone/screens/contatos_conversas.dart';
import 'package:WhatsAppClone/screens/conversa_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class GerarRotas {
  List<ContatoConversa> _contatoConversa = mocks.contatoConversa;
  List<ContatoChamada> _contatoChamada = mocks.contatoChamada;
  List<ContatoStatus> _contatoStatus = mocks.contatoStatus;

  List<CameraDescription> cameras;
  GerarRotas(this.cameras);
  Route<dynamic> geradorRotas(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(
          builder: (_) =>
              Home(cameras, _contatoConversa, _contatoChamada, _contatoStatus),
        );
      case "/camera":
        return MaterialPageRoute(
          builder: (_) => CameraScreen(cameras),
        );
      case "/conversa":
        return MaterialPageRoute(
          builder: (_) => ConversaScreen(_contatoConversa),
        );
      case "/contatos_conversa":
        return MaterialPageRoute(
          builder: (_) => BotaoConversa(_contatoConversa),
        );
      case "/contatos_chamada":
        return MaterialPageRoute(
          builder: (_) => ListaChamada(_contatoChamada),
        );
    }
  }
}
