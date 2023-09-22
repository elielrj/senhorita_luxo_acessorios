import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/cores/cores.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/textos/textos.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Produto.dart';

class TelaAdicionarProduto extends StatefulWidget {
  const TelaAdicionarProduto({super.key});

  @override
  State<TelaAdicionarProduto> createState() => _TelaAdicionarProdutoState();
}

class _TelaAdicionarProdutoState extends State<TelaAdicionarProduto> {
  final _controllerNome = TextEditingController();
  final _controllerCodigo = TextEditingController();
  final _controllerEstoqueQuantidade = TextEditingController();
  final _controllerEstoqueValorDeAquisicao = TextEditingController();
  final _controllerEstoqueValorDeVenda = TextEditingController();
  final _imagensDoProduto = <XFile>[];
  String _erroAoBuscarImagem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(textoAdicionarProduto),
        backgroundColor: corRosaPrincipalDaSenhoritaLuxoAcessorios,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 01 - Nome do Produto
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextField(
                controller: _controllerNome,
                keyboardType: TextInputType.text,
                decoration:
                    const InputDecoration(labelText: textoNomeDoProduto),
                maxLength: 1,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            // 02 - Código do Produto
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextField(
                controller: _controllerCodigo,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: textoCodigoDoProduto),
                maxLength: 1,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            //03 - Quantidade do Produto
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextField(
                controller: _controllerEstoqueQuantidade,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: textoEstoqueQuantidadeDoProduto),
                maxLength: 1,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            //04 - Valor de Aquisição do Produto
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextField(
                controller: _controllerEstoqueValorDeAquisicao,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: textoEstoqueValorDeAquisicaoDoProduto),
                maxLength: 1,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            //05 - Valor de Venda do Produto
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextField(
                controller: _controllerEstoqueValorDeVenda,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: textoEstoqueValorDeVencaDoProduto),
                maxLength: 1,
                maxLengthEnforcement: MaxLengthEnforcement.none,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //Botões da Camera e Galeria
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Botão Camera
                      Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.blueGrey,
                              padding: const EdgeInsets.all(16),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () async {
                              _erroAoBuscarImagem = '';
                              try {
                                XFile? imagem = await ImagePicker()
                                    .pickImage(source: ImageSource.camera);
                                if (imagem != null) {
                                  setState(() {
                                    _imagensDoProduto.add(imagem);
                                  });
                                }
                              } catch (e) {
                                setState(() {
                                  _erroAoBuscarImagem = textoErroAoBuscarImagem;
                                  _erroAoBuscarImagem += "\n";
                                  _erroAoBuscarImagem += e.toString();
                                });
                              }
                            },
                            child: const Text('Camera')),
                      ),
                      const SizedBox(width: 8),
                      //Botão Galeria
                      Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.blueGrey,
                              padding: const EdgeInsets.all(16),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () async {
                              _erroAoBuscarImagem = '';
                              try {
                                XFile? imagem = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (imagem != null) {
                                  setState(() {
                                    _imagensDoProduto.add(imagem);
                                  });
                                }
                              } catch (e) {
                                setState(() {
                                  _erroAoBuscarImagem = textoErroAoBuscarImagem;
                                  _erroAoBuscarImagem += "\n";
                                  _erroAoBuscarImagem += e.toString();
                                });
                              }
                            },
                            child: const Text('Galeria')),
                      ),
                    ],
                  ),
                  //Mensagem de erro em caso de falha
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(_erroAoBuscarImagem),
                    ],
                  ),
                  //Exibição prévia da imagem capturada
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (XFile xFile in _imagensDoProduto)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Image.file(File(xFile.path)),
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
