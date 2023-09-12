import 'package:senhorita_luxo_acessorios/model/pedido/ItemDoPedido.dart';

class Pedido {
  String numero;
  DateTime dataHora;
  double valorTotal;
  double descontoTotal;
  String observacao;
  bool pago;
  List<ItemDoPedido> itensDoPedido;

  Pedido(this.numero, this.dataHora, this.valorTotal, this.descontoTotal,
      this.observacao, this.pago, this.itensDoPedido);
}
