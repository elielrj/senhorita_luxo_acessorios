import 'Estado.dart';

class Cidade {
  String nome;
  Estado estado;

  Cidade(this.nome, this.estado);

  @override
  String toString() {
    return "$nome, ${estado.toString()}";
  }
}
