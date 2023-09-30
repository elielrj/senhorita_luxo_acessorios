import 'package:senhorita_luxo_acessorios/model/bo/produto/Produto.dart';

class Categoria {
  int? id;
  String? nome;
  List<Produto>? listaDeProdutos;

  Categoria({this.id, this.nome, this.listaDeProdutos});

  factory Categoria.fromMap(Map<String, dynamic> map) {
    return Categoria(
      id: map['id'],
      nome: map['nome'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }
}
