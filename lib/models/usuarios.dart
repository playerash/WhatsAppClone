class Contato {
  String nome;
  String imagem;
  bool selecionado = false;
  String mensagem;
  String dataMensagem;
  int iconChamada;
  String dataChamada;
  String horaChamada;
  int iconTipoChamada;
  List<String> imagensStatus;
  String horaStatus;

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
  String hora;
  int iconTipoChamada;
  bool selecionado = false;

  ContatoChamada(
    String nome,
    String imagem,
    this.iconChamada,
    this.data,
    this.hora,
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
