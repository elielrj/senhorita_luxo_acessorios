

import 'package:senhorita_luxo_acessorios/model/bo/pessoa/usuario/Funcao/NivelDeAcesso/NivelDeAcesso.dart';

class Vender implements NivelDeAcesso {
  static const String NOME = 'vender';

  @override
  String nome() {
    return NOME;
  }
}
