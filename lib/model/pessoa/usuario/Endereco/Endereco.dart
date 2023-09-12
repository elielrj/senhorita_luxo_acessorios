import 'Cidade.dart';

class Endereco {
  String nome;
  String logradouro;
  String numero;
  String complemento;
  String cep;
  String bairro;
  Cidade cidade;

  Endereco(this.nome, this.logradouro, this.numero, this.complemento, this.cep,
      this.bairro, this.cidade);

  @override
  String toString() {
    String endereco = nome == '' ? '' : '$nome,';

    endereco += '$logradouro, ';

    endereco += numero;

    endereco += complemento == '' ? '' : '$complemento, \n';

    endereco += '$bairro, ';

    endereco += cidade.toString();

    return endereco;
  }
}
