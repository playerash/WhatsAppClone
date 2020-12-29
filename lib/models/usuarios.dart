class Contato {
  String nome;
  String imagem;
  Contato(this.nome, this.imagem);
}

class ContatoConversa extends Contato {
  String mensagem;
  String data;
  bool selecionado = false;

  ContatoConversa(
    String nome,
    String imagem,
    this.mensagem,
    this.data,
  ) : super(nome, imagem);
}

class ContatoChamada extends Contato {
  int iconChamada;
  String data;
  int iconTipoChamada;
  bool selecionado = false;

  ContatoChamada(
    String nome,
    String imagem,
    this.iconChamada,
    this.data,
    this.iconTipoChamada,
  ) : super(nome, imagem);
}

class ContatoStatus extends Contato {
  List<String> imagens;
  String hora;

  ContatoStatus(
    String nome,
    String imagem,
    this.imagens,
    this.hora,
  ) : super(nome, imagem);

}
