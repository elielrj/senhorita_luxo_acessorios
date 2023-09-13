
import 'package:senhorita_luxo_acessorios/model/bo/pessoa/usuario/Funcao/NivelDeAcesso/NivelDeAcesso.dart';

class Root implements NivelDeAcesso {
  static const String NOME = 'root';

  @override
  String nome() {
    return NOME;
  }
}
