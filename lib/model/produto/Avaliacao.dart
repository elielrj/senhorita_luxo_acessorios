
import 'package:senhorita_luxo_acessorios/model/pessoa/usuario/Usuario.dart';
import 'package:senhorita_luxo_acessorios/model/produto/Produto.dart';

class Avaliacao{

  int nota;
  DateTime dataHora;
  Usuario usuario;
  Produto produto;

  Avaliacao(this.nota, this.dataHora,this.usuario,this.produto);


}