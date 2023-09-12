import 'Arquivo.dart';
import 'Avaliacao.dart';
import 'Categoria.dart';
import 'Curtida.dart';
import 'Estoque.dart';
import 'Visualizacao.dart';

class Produto {
  String nome;
  String codigo;
  List<Categoria> listaDeCategorias;
  List<Visualizacao> listaDeVisualizacoes;
  List<Curtida> listaDeCurtidas;
  List<Avaliacao> listaDeAvaliacoes;
  Estoque estoque;
  List<Arquivo> listaDeArquivos;

  Produto(
      this.nome,
      this.codigo,
      this.listaDeCategorias,
      this.listaDeVisualizacoes,
      this.listaDeCurtidas,
      this.listaDeAvaliacoes,
      this.estoque,
      this.listaDeArquivos);
}
