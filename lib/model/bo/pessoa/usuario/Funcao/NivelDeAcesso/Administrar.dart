
import 'package:senhorita_luxo_acessorios/model/bo/pessoa/usuario/Funcao/NivelDeAcesso/NivelDeAcesso.dart';

class Administrar implements NivelDeAcesso {
  static const String NOME = 'administrar';

  @override
  String nome() {
    return NOME;
  }
}
