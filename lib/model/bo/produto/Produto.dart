import 'package:cloud_firestore/cloud_firestore.dart';

import 'Arquivo.dart';
import 'Avaliacao.dart';
import 'Categoria.dart';
import 'Curtida.dart';
import 'Estoque.dart';
import 'Visualizacao.dart';

class Produto {
  final String? codigo;
  final Estoque? estoque;
  final String? nome;
  final List<Avaliacao>? listaDeAvaliacoes;
  final List<Arquivo>? listaDeArquivos;
  final List<Categoria>? listaDeCategorias;
  final List<Curtida>? listaDeCurtidas;
  final List<Visualizacao>? listaDeVisualizacoes;

  Produto({
    this.codigo,
    this.estoque,
    this.nome,
    this.listaDeAvaliacoes,
    this.listaDeArquivos,
    this.listaDeCategorias,
    this.listaDeCurtidas,
    this.listaDeVisualizacoes,
  });

  factory Produto.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? optios,
  ) {
    final data = snapshot.data();
    return Produto(
      codigo: data?['codigo'],
      estoque: data?['estoque'],
      nome: data?['nome'],
      listaDeAvaliacoes: data?['lista_de_avaliacoes'] is Iterable ? List.from(data?['lista_de_avaliacoes']) : null,
      listaDeArquivos: data?['lista_de_arquivos'] is Iterable ? List.from(data?['lista_de_arquivos']) : null,
      listaDeCategorias: data?['lista_de_categorias'] is Iterable ? List.from(data?['lista_de_categorias']) : null,
      listaDeCurtidas: data?['lista_de_curtidas'] is Iterable ? List.from(data?['lista_de_curtidas']) : null,
      listaDeVisualizacoes:
          data?['lista_de_visualizacoes'] is Iterable ? List.from(data?['lista_de_visualizacoes']) : null,
    );
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      codigo: map['codigo'],
      estoque: map['estoque'],
      nome: map['nome'],
      listaDeAvaliacoes: map['lista_de_avaliacoes'] is Iterable ? List.from(map['lista_de_avaliacoes']) : null,
      listaDeArquivos: map['lista_de_arquivos'] is Iterable ? List.from(map['lista_de_arquivos']) : null,
      listaDeCategorias: map['lista_de_categorias'] is Iterable ? List.from(map['lista_de_categorias']) : null,
      listaDeCurtidas: map['lista_de_curtidas'] is Iterable ? List.from(map['lista_de_curtidas']) : null,
      listaDeVisualizacoes: map['lista_de_visualizacoes'] is Iterable ? List.from(map['lista_de_visualizacoes']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nome': nome,
      'codigo': codigo,
      'estoque': estoque,
      'lista_de_avaliacoes': listaDeAvaliacoes,
      'lista_de_arquivos': listaDeArquivos,
      'lista_de_categorias': listaDeCategorias,
      'lista_de_curtidas': listaDeCurtidas,
      'lista_de_visualizacoes': listaDeVisualizacoes,
    };
  }
}
