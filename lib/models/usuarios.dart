import 'package:flutter/cupertino.dart';

class Contato {
  String nome;
  String imagem;
  Contato(this.nome, this.imagem);
}

class ContatoConversa extends Contato {
  String mensagem;
  String data;
  ContatoConversa(String nome, String imagem, this.mensagem, this.data) : super(nome, imagem);
}
