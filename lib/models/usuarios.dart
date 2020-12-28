import 'package:flutter/cupertino.dart';

class Contato {
  String nome;
  Image perfil;
  Contato(this.nome, this.perfil);
}

class ContatoConversa extends Contato {
  String mesagem;
  String dataMensagem;
  ContatoConversa(String nome, Image perfil, this.mesagem, this.dataMensagem)
      : super(nome, perfil);
}
