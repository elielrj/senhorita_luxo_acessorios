import 'package:senhorita_luxo_acessorios/model/bo/produto/Categoria.dart';

class Departamento {
  int? id;
  String? nome;
  List<Categoria>? listaDeCategorias;

  Departamento({this.id, this.nome, this.listaDeCategorias});

  factory Departamento.fromMap(Map<String, dynamic> map) {
    return Departamento(
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
