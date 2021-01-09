import 'package:WhatsAppClone/compomentes/dados_perfil/imagem_perfil.dart';
import 'package:WhatsAppClone/models/usuario.dart';
import 'package:WhatsAppClone/services/authservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DadosPerfil extends StatefulWidget {
  @override
  _DadosPerfilState createState() => _DadosPerfilState();
}

class _DadosPerfilState extends State<DadosPerfil> {
 // TextEditingController _nomeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dados de perfil",
          style: TextStyle(color: Color(0xFF075E54)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(
            child: Text("Insira seu nome e uma foto de perfil(opcional)"),
          ),
          ImagemPerfil(),
          TextField(
            onChanged: (value) {
              setState(() {
                usuario.nome = value;
                usuario.numero = FirebaseAuth.instance.currentUser.phoneNumber;
              });
            },
            decoration: InputDecoration(hintText: "Digite seu nome"),
          ),
          RaisedButton(
            child: Text("AVANÇAR", style: TextStyle(color: Colors.white),),
            onPressed: () {
              AuthService().dadosUsuario(usuario);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
