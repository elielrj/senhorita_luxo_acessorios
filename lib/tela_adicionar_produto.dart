import 'package:flutter/material.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/textos/textos.dart';

class TelaAdicionarProduto extends StatefulWidget {
  const TelaAdicionarProduto({super.key});

  @override
  State<TelaAdicionarProduto> createState() => _TelaAdicionarProdutoState();
}

class _TelaAdicionarProdutoState extends State<TelaAdicionarProduto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(textoAdicionarProduto),
      ),
      body: const Center(
        child: Text('Tela Adicionar Produto'),
      ),
    );
  }
}
