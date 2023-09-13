
import 'package:senhorita_luxo_acessorios/model/bo/pessoa/usuario/Usuario.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Produto.dart';

class Avaliacao{

  int? nota;
  DateTime? dataHora;
  Usuario? usuario;
  Produto? produto;

  Avaliacao({this.nota, this.dataHora, this.usuario, this.produto});


}