class Contato {
  String nome;
  String numero;
  String imagem;
  Contato(this.nome, this.imagem);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "nome": this.nome,
      "numero": this.numero,
    };
    return map;
  }
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
