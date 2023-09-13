import 'package:senhorita_luxo_acessorios/model/bo/pessoa/usuario/Usuario.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Produto.dart';

class ListaDeDesejos {
  DateTime? dataHoraModificacao;
  Usuario? usuario;
  List<Produto>? listaDeProdutos;

  ListaDeDesejos(
      {this.dataHoraModificacao, this.usuario, this.listaDeProdutos});
}
