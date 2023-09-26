import 'package:senhorita_luxo_acessorios/model/bo/produto/Produto.dart';

class Categoria {
  String? descricao;
  List<Produto>? listaDeProdutos;

  Categoria({this.descricao, this.listaDeProdutos});

  factory Categoria.fromMap(Map<String, dynamic> map) {
    return Categoria(
      descricao: map['descricao'],
    );
  }
}
