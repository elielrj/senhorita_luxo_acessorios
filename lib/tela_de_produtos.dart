import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/cores/cores.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Produto.dart';
import 'package:senhorita_luxo_acessorios/tela_de_um_produto.dart';

import 'bibioteca/textos/textos.dart';

class TelaDeProdutos extends StatefulWidget {
  const TelaDeProdutos({super.key});

  @override
  State<TelaDeProdutos> createState() => _TelaDeProdutosState();
}

class _TelaDeProdutosState extends State<TelaDeProdutos> {
  final Stream<QuerySnapshot> _produtosStream =
      FirebaseFirestore.instance.collection('produtos').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _produtosStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;
          case ConnectionState.waiting:
            return const Center(
              child: Text(textoStreamBuilderBuscando),
            );

          case ConnectionState.active:
            if (snapshot.hasError) {
              return const Center(
                child: Text(textoDeErroAoAtivarConexao),
              );
            } else if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 8, right: 8, bottom: 32),
                child: Wrap(
                  alignment: WrapAlignment.spaceAround,
                  runSpacing: 10,
                  spacing: 10,
                  children: snapshot.data!.docs
                      .map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return Container(
                            color:
                                corVerdeClaroSecundAriaDaSenhoritaLuxoAcessorios,
                            height: 300,
                            width: 180,
                            child: TelaDeUmProduto(
                                produto: Produto.fromMap(data)));
                      })
                      .toList()
                      .cast(),
                ),
              );
            } else {
              return const Text(textoDeErroDesconhecidoAoAtivarConexao);
            }
          case ConnectionState.done:
            if (snapshot.hasError) {
              return const Center(
                child: Text(textoDeErroDeConexaoFinalizada),
              );
            } else {
              return const Text(textoDeErroDeConexaoFinalizada);
            }
          default:
            return const Text(textoDeErroAoTentarReceberDadosDoStreamBuilder);
        }
        return Container(
          color: Colors.blue,
          width: 0,
          child: const Text('Erro.'),
        );
      },
    );
  }
}
