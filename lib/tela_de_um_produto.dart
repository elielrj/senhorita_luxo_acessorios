import 'package:flutter/material.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Arquivo.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Produto.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TelaDeUmProduto extends StatefulWidget {
  const TelaDeUmProduto({super.key, required this.produto});

  final Produto produto;

  @override
  State<TelaDeUmProduto> createState() => _TelaDeUmProdutoState();
}

class _TelaDeUmProdutoState extends State<TelaDeUmProduto> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.produto.nome!),
          Text(widget.produto.estoque!.quantidade!.toString()),
          widget.produto.listaDeArquivos is Iterable
              ? SizedBox(
                  width: 120,
                  height: 170,
                  child: Stack(
                    children: [
                      PageView(
                        controller: _controller,
                        children: [
                          for (Arquivo arquivo
                              in widget.produto.listaDeArquivos!)
                            Image.asset(
                              arquivo.path.toString(),
                              // width: 60,
                              // height: 100,
                            )
                        ],
                      ),
                      Container(
                        //width: 60,
                        // height: 100,
                        alignment: const Alignment(0, 0.75),
                        child: SmoothPageIndicator(
                          controller: _controller,
                          count: widget.produto.listaDeArquivos!.length,
                          onDotClicked: (index) =>
                              _controller.jumpToPage(index),
                        ),
                      ),
                    ],
                  ))
              : Container(
                  width: 0,
                ),
        ],
      ),
      subtitle: Text(widget.produto.codigo!),
    );
  }
}
