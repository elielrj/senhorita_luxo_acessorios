class Estoque {
  late int? quantidade;
  late double? valorDeAquisicao;
  late double? valorDeVenda;

  Estoque({this.quantidade, this.valorDeAquisicao, this.valorDeVenda});

  factory Estoque.fromMap(Map<String, dynamic>? map) {
    return Estoque(
      quantidade: map?['quantidade'],
      valorDeAquisicao: map?['valor_de_aquisicao'],
      valorDeVenda: map?['valor_de_venda'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'quantidade': quantidade,
      'valor_de_aquisicao': valorDeAquisicao,
      'valor_de_venda': valorDeVenda,
    };
  }
}
