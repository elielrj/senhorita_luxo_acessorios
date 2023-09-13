
import 'package:senhorita_luxo_acessorios/model/bo/pessoa/usuario/Funcao/NivelDeAcesso/NivelDeAcesso.dart';

class Estocar implements NivelDeAcesso {
  static const String NOME = 'estocar';

  @override
  String nome() {
    return NOME;
  }
}
