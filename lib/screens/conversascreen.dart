import 'package:WhatsAppClone/compomentes/ConversaSelecinada.dart';
import 'package:WhatsAppClone/models/usuarios.dart';
import 'package:flutter/material.dart';

class ConversaScreen extends StatefulWidget {
  @override
  _ConversaScreenState createState() => _ConversaScreenState();
}

class _ConversaScreenState extends State<ConversaScreen> {

 
  List _contatos = [
    //ContatoConversa("Buri", "images/saburi.jpg", "Eu te amo", "25/12/2020"),
    //ContatoConversa("Ana", "images/ana.jpg", "socoroo", "24/12/2020"),
    {
      "nome": "Buri Buri",
      "imagem": "images/saburi.jpg",
      "mensagem": "Eu te amo",
      "data": "25/12/2020"
    },
    {
      "nome": "Ana",
      "imagem": "images/ana.jpg",
      "mensagem": "Quando rolê?",
      "data": "28/12/2020"
    },
    {
      "nome": "Vini",
      "imagem": "images/vini.jpg",
      "mensagem": "Compra outro jogo pra mim?",
      "data": "28/12/2020"
    },
    {
      "nome": "Avatar",
      "imagem": "images/avatar.jpg",
      "mensagem": "Cadê meu ifood man?",
      "data": "28/12/2020"
    },
    {
      "nome": "Nat",
      "imagem": "images/nat.jpg",
      "mensagem": "Já superou?",
      "data": "28/12/2020"
    },
    {
      "nome": "Natan",
      "imagem": "images/natan.jpg",
      "mensagem": "Hackeia o insta dela ai man",
      "data": "28/12/2020"
    },
  ];

  bool _conversaSelecionada = false;
  List selecionados = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey,
          );
        },
        itemCount: _contatos.length,
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _conversaSelecionada
                  ? ConversaSelecionada(_contatos[index]["imagem"])
                  : ConversaNaoSelecionada(_contatos[index]["imagem"]),
              Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 70,
                child: ListTile(

                  selectedTileColor: Color(0xfff2f2f2),
                  selected: _conversaSelecionada,
                  onLongPress: () {
                    print(index);
                    setState(() {
                      _conversaSelecionada = true;
                    });
                  },
                  onTap: _conversaSelecionada
                      ? () {
                          setState(() {
                            _conversaSelecionada = false;
                          });
                        }
                      : () {},
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _contatos[index]["nome"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _contatos[index]["data"],
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )
                    ],
                  ),
                  subtitle: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Icon(
                          Icons.check,
                          color: Colors.grey,
                          size: 16,
                        ),
                      ),
                      Text(
                        _contatos[index]["mensagem"],
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
