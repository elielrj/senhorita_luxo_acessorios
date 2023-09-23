import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/textos/textos.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Produto.dart';
import 'package:senhorita_luxo_acessorios/tela_imagem_de_produto.dart';
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
      title: Container(
        child: widget.produto.listaDeArquivos is Iterable
            ? SizedBox(
                width: 120,
                height: 170,
                child: Stack(
                  children: [
                    PageView(
                      controller: _controller,
                      children: [
                        for (String nome in widget.produto.listaDeArquivos!)
                          TelaImagemDeProduto(codigo: widget.produto.codigo!, nome: nome)
                      ],
                    ),
                    Container(
                      //width: 60,
                      // height: 100,
                      alignment: const Alignment(0, 0.75),
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: widget.produto.listaDeArquivos!.length,
                        onDotClicked: (index) => _controller.jumpToPage(index),
                      ),
                    ),
                  ],
                ))
            : Container(width: 0),
      ),
      subtitle: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              widget.produto.nome!.toString()[0].toUpperCase() +
                  widget.produto.nome!.toString().substring(1).toLowerCase(),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              "$textpQuantidade ${widget.produto.estoque!.quantidade!.toString()}",
              style: const TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text("$textoCodigo ${widget.produto.codigo!}",
                style: const TextStyle(fontSize: 10, color: Colors.black45)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              "R\$ ${widget.produto.estoque!.valorDeVenda.toString()}",
              style: const TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
