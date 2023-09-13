
import 'package:senhorita_luxo_acessorios/model/bo/pedido/Pedido.dart';
import 'package:senhorita_luxo_acessorios/model/bo/pessoa/usuario/Endereco/Endereco.dart';
import 'package:senhorita_luxo_acessorios/model/bo/pessoa/usuario/Funcao/Funcao.dart';
import 'package:senhorita_luxo_acessorios/model/bo/pessoa/usuario/ListaDeDesejos.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Avaliacao.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Visualizacao.dart';

class Usuario {
  String? nomeCompleto;
  String? ddd;
  String? celular;
  DateTime? dataHoraDoCadastro;
  DateTime? dataHoraUltimoAcesso;
  int? quantidadeDeLogin;
  List<Funcao>? listaDeFuncoes;
  String? email;
  String? senha;
  DateTime? dataDeNascimento;
  String? cpf;
  List<Endereco>? listaDeEnderecos;
  List<Pedido>? listaDePedidos;
  List<Visualizacao>? listaDeVisualizacoes;
  List<Avaliacao>? listaDeAvaliacoes;
  ListaDeDesejos? listaDeDesejos;

  Usuario({
      this.celular,
      this.ddd,
      this.nomeCompleto,
      this.listaDeFuncoes,
      this.dataHoraDoCadastro,
      this.dataHoraUltimoAcesso,
      this.quantidadeDeLogin,
      this.email,
      this.senha,
      this.dataDeNascimento,
      this.cpf,
      this.listaDeEnderecos,
      this.listaDePedidos,
      this.listaDeVisualizacoes,
      this.listaDeAvaliacoes,
      this.listaDeDesejos});
}
