class Usuario {
  String nome;
  String numero;
  Usuario();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "nome": this.nome,
      "numero": this.numero,
    };
    return map;
  }
}

Usuario usuario = Usuario();
