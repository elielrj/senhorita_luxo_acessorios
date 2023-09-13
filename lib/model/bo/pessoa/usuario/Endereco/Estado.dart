class Estado {
  String? nome;
  String? sigla;

  Estado({this.nome, this.sigla});

  @override
  String toString() {
    return "$nome - $sigla";
  }
}
