import 'package:senhorita_luxo_acessorios/model/bo/produto/Categoria.dart';

class Departamento {
  String? nome;
  List<Categoria>? listaDeCategorias;

  Departamento({this.nome, this.listaDeCategorias});

  factory Departamento.fromMap(Map<String, dynamic> map) {
    return Departamento(
      nome: map['nome'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'nome': nome};
  }
}
