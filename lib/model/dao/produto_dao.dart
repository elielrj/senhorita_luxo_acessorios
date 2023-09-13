import 'package:flutter/cupertino.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Estoque.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Produto.dart';
import 'package:senhorita_luxo_acessorios/model/dao/interface_map.dart';
import 'package:senhorita_luxo_acessorios/model/dao/interfce_crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProdutoDAO implements InterfaceCRUD<Produto>, InterfaceMap<Produto> {
  static const colecaoDeProdutos = 'produtos';

  final db = FirebaseFirestore.instance;

  @override
  Future<void> atualizar(Produto objeto) async {
    final map = converterObjetoEmMap(objeto);

    await db
        .collection(colecaoDeProdutos)
        .doc()
        .update(map)
        .onError((error, _) => debugPrint('Error update document: $error'));
  }

  @override
  Future<Produto> buscar(String chave, String valor) async {
    Produto produto = Produto();

    await db
        .collection(colecaoDeProdutos)
        .where(chave, isEqualTo: valor)
        .get()
        .then(
      (querySnapshot) {
        debugPrint("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          produto = docSnapshot.data() as Produto;
        }
      },
      onError: (e) => debugPrint("Error completing: $e"),
    );
    return produto;
  }

  @override
  Future<List<Produto>> buscarTodos() async {
    List<Produto> listaDeProdutos = [];

    await db.collection(colecaoDeProdutos).get().then(
      (querySnapshot) {
        debugPrint("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          listaDeProdutos.add(docSnapshot.data() as Produto);
        }
      },
      onError: (e) => debugPrint("Error completing: $e"),
    );
    return listaDeProdutos;
  }

  @override
  Future<void> criar(Produto objeto) async {
    final map = converterObjetoEmMap(objeto);

    await db
        .collection(colecaoDeProdutos)
        .doc()
        .set(map)
        .onError((error, _) => debugPrint('Error writing document: $error'));
  }

  @override
  Future<void> deletar(Produto objeto) async {
    debugPrint('Não é possível excluir objeto!');
  }

  @override
  List<Produto> converterListaDeMapEmListaDeObjetos(
      List<Map<String, dynamic>> listaDeMap) {
    final List<Produto> listaDeProdutos = [];

    for (var mapDeProduto in listaDeMap) {
      listaDeProdutos.add(converterMapEmObjeto(mapDeProduto));
    }
    return listaDeProdutos;
  }

  @override
  List<Map<String, dynamic>> converterListaDeObjetosEmListDeMap(
      List<Produto> listaDeObjetos) {
    final List<Map<String, dynamic>> listaDeMap = [];

    for (var objeto in listaDeObjetos) {
      listaDeMap.add(converterObjetoEmMap(objeto));
    }
    return listaDeMap;
  }

  @override
  Produto converterMapEmObjeto(Map<String, dynamic> map) {
    return Produto(
        nome: map['nome'],
        codigo: map['codigo'],
        estoque: Estoque(
            quantidade: map['estoque']['quantidade'],
            valorDeAquisicao: map['estoque']['valor_de_aquisicao'],
            valorDeVenda: map['estoque']['valor_de_venda']),
        listaDeCategorias: map['lista_de_categorias'],
        listaDeArquivos: map['lista_de_arquivos'],
        listaDeCurtidas: map['lista_de_curtidas'],
        listaDeAvaliacoes: map['lista_de_avaliacoes'],
        listaDeVisualizacoes: map['lista_de_visualizacoes']);
  }

  @override
  Map<String, dynamic> converterObjetoEmMap(Produto objeto) {
    return Map.from({
      'nome': objeto.nome,
      'codigo': objeto.codigo,
      'estoque': Map.from({
        'quantidade': objeto.estoque?.quantidade,
        'valor_de_aquisicao': objeto.estoque?.valorDeAquisicao,
        'valor_de_venda': objeto.estoque?.valorDeVenda,
      }),
      'lista_de_categorias': objeto.listaDeCategorias?.toList(),
      'lista_de_arquivos': objeto.listaDeArquivos,
      'lista_de_curtidas': objeto.listaDeCurtidas,
      'lista_de_avaliacoes': objeto.listaDeAvaliacoes,
      'lista_de_visualizacoes': objeto.listaDeVisualizacoes,
    });
  }
}
