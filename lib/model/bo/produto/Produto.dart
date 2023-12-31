import 'package:cloud_firestore/cloud_firestore.dart';

import 'Avaliacao.dart';
import 'Categoria.dart';
import 'Curtida.dart';
import 'Estoque.dart';
import 'Visualizacao.dart';

class Produto {
  late int? id;
  final String? codigo;
  final Estoque? estoque;
  final String? nome;
  final List<Avaliacao>? listaDeAvaliacoes;
  late List<String>? listaDeArquivos;
  final List<Categoria>? listaDeCategorias;
  final List<Curtida>? listaDeCurtidas;
  final List<Visualizacao>? listaDeVisualizacoes;

  Produto({
    this.id,
    this.codigo,
    this.estoque,
    this.nome,
    this.listaDeAvaliacoes,
    this.listaDeArquivos,
    this.listaDeCategorias,
    this.listaDeCurtidas,
    this.listaDeVisualizacoes,
  });

  factory Produto.fromMap(Map<String, dynamic>? map) {
    return Produto(
      id: map?['id'],
      codigo: map?['codigo'],
      estoque: map?['estoque'] is Map ? Estoque.fromMap(map?['estoque']) : null,
      nome: map?['nome'],
      //listaDeAvaliacoes: map?['lista_de_avaliacoes'] is Iterable ? List.from(map?['lista_de_avaliacoes']) : null,
      listaDeArquivos: map?['lista_de_arquivos'] is Iterable
          ? List.from(map!['lista_de_arquivos'])
          : null,
      //listaDeCategorias: map?['lista_de_categorias'] is Iterable ? List.from(map?['lista_de_categorias']) : null,
      //listaDeCurtidas: map?['lista_de_curtidas'] is Iterable ? List.from(map?['lista_de_curtidas']) : null,
      //listaDeVisualizacoes: map?['lista_de_visualizacoes'] is Iterable ? List.from(map?['lista_de_visualizacoes']) : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'nome': nome,
      'codigo': codigo,
      'estoque': estoque?.toFirestore(),
      'lista_de_arquivos': listaDeArquivos,
      //'lista_de_avaliacoes': listaDeAvaliacoes,
      'lista_de_categorias': listaDeCategorias
          ?.map((Categoria categoria) => FirebaseFirestore.instance
              .collection('categorias')
              .doc(categoria.id.toString()))
          .toList()
          .cast(),
      //'lista_de_curtidas': listaDeCurtidas,
      //'lista_de_visualizacoes': listaDeVisualizacoes,
    };
  }
}
