import 'package:WhatsAppClone/home.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:WhatsAppClone/screens/camerascreen.dart';
import 'package:WhatsAppClone/screens/chatscreen.dart';
import 'package:WhatsAppClone/screens/contatos_chamadas.dart';
import 'package:WhatsAppClone/screens/contatos_conversas.dart';
import 'package:WhatsAppClone/screens/conversascreen.dart';
import 'package:WhatsAppClone/screens/interiorChamada.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class GerarRotas {
  List<ContatoConversa> _contatoConversa = [
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

  List<ContatoChamada> _contatoChamada = [
    ContatoChamada("Ana", "images/ana.jpg", 1, "Hoje ", "17:00", 1),
    ContatoChamada("Avatar", "images/avatar.jpg", 0, "Hoje ", "12:00", 0),
    ContatoChamada(
        "Diego Saburi", "images/saburi.jpg", 2, "28 de dezembro ", "13:00", 1),
  ];
  List<CameraDescription> cameras;
  GerarRotas(this.cameras);
  Route<dynamic> geradorRotas(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (_) => Home(cameras, _contatoConversa,_contatoChamada));
      case "/camera":
        return MaterialPageRoute(builder: (_) => CameraScreen(cameras));
      case "conversa":
        return MaterialPageRoute(builder: (_) => ConversaScreen(_contatoConversa));
      case "contatos_conversa":
        return MaterialPageRoute(builder: (_) => BotaoConversa(_contatoConversa));
      case "contatos_chamada":
        return MaterialPageRoute(builder: (_) => ListaChamada(_contatoChamada));
    }
  }
}
