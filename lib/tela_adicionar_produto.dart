import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/cores/cores.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/textos/textos.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Arquivo.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Estoque.dart';
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
            //06 - Capturas de Imagens
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
                        child: _imagensDoProduto.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Container(
                                    color: Colors.black26,
                                    child: const SizedBox(height: 300)),
                              )
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  for (XFile xFile in _imagensDoProduto)
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Image.file(File(xFile.path)),
                                    )
                                ],
                              ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            //Botões de Enviar e Cancelar
            Padding(
              padding: const EdgeInsets.only(
                  top: 8.0, bottom: 32, right: 8, left: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Botão Enviar
                      Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.blueGrey,
                              padding: const EdgeInsets.all(16),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () async {
                              final produto = Produto(
                                nome: _controllerNome.text,
                                codigo: _controllerCodigo.text,
                                estoque: Estoque(
                                  quantidade: int.tryParse(
                                          _controllerEstoqueQuantidade.text
                                              .toString()) ??
                                      0,
                                  valorDeAquisicao: double.tryParse(
                                          _controllerEstoqueValorDeAquisicao
                                              .text
                                              .toString()) ??
                                      0,
                                  valorDeVenda: double.tryParse(
                                          _controllerEstoqueValorDeVenda.text
                                              .toString()) ??
                                      0,
                                ),
                                listaDeArquivos: _imagensDoProduto
                                    .map((XFile xFile) {
                                      Map<String, dynamic> data =
                                          xFile as Map<String, dynamic>;
                                      return Arquivo.fromMap(data);
                                    })
                                    .toList()
                                    .cast(),
                              );

                              try {
                                //FirebaseStorage.instance.ref('produtos').child() todo
                              } catch (e) {}
                            },
                            child: const Text(textoEnviar)),
                      ),
                      const SizedBox(width: 8),
                      //Botão Cancelar
                      Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.blueGrey,
                              padding: const EdgeInsets.all(16),
                              textStyle: const TextStyle(fontSize: 20),
                            ),
                            onPressed: () async {
                              try {} catch (e) {}
                            },
                            child: const Text(textoCancelar)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
