
import 'package:senhorita_luxo_acessorios/model/bo/pessoa/usuario/Funcao/NivelDeAcesso/NivelDeAcesso.dart';

class Comprar implements NivelDeAcesso {
  static const String NOME = 'comprar';

  @override
  String nome() {
    return NOME;
  }
}
