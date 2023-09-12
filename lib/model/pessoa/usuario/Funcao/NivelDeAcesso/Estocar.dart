
import 'package:senhorita_luxo_acessorios/model/pessoa/usuario/Funcao/NivelDeAcesso/NivelDeAcesso.dart';

class Estocar implements NivelDeAcesso {
  static const String NOME = 'estocar';

  @override
  String nome() {
    return NOME;
  }
}
