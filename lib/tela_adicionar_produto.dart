import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/cores/cores.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/textos/textos.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Categoria.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Estoque.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Produto.dart';
import 'package:senhorita_luxo_acessorios/tela_home.dart';

class TelaAdicionarProduto extends StatefulWidget {
  const TelaAdicionarProduto({super.key});

  @override
  State<TelaAdicionarProduto> createState() => _TelaAdicionarProdutoState();
}

class _TelaAdicionarProdutoState extends State<TelaAdicionarProduto> {
  final _controllerNome = TextEditingController();
  final _controllerCodigo =
      TextEditingController(text: Random().nextInt(100000).toString());
  final _controllerEstoqueQuantidade = TextEditingController();
  final _controllerEstoqueValorDeAquisicao = TextEditingController();
  final _controllerEstoqueValorDeVenda = TextEditingController();
  final _imagensDoProduto = <XFile>[];
  String _erroAoBuscarImagem = '';
  final _listaDeCategorias = <Categoria>[];
  final _listaDeCategoriasSelecionadas = <bool>[];
  Categoria? _dropdownValueCategoria;

  Future<void> _buscarCategorias() async {
    await FirebaseFirestore.instance
        .collection('categorias')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (QueryDocumentSnapshot queryDocumentSnapshot in querySnapshot.docs) {
        final data = queryDocumentSnapshot.data() as Map<String, dynamic>;
        _listaDeCategorias.add(Categoria.fromMap(data));
        _listaDeCategoriasSelecionadas.add(false);
      }
    });
    setState(() {
      _dropdownValueCategoria = _listaDeCategorias.first;
      _listaDeCategorias;
    });
  }

  @override
  void initState() {
    super.initState();
    _buscarCategorias();
  }

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
                enabled: false,
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
            // 06 - Categoria do produto
            Column(
              children: [
                const Text(
                  textoCategoria,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                _listaDeCategorias.isEmpty
                    ? const SizedBox(width: 0)
                    : Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Container(
                          color:
                              corVerdeClaroSecundAriaDaSenhoritaLuxoAcessorios,
                          child: Column(
                            children: [
                              for (int index = 0;
                                  index < _listaDeCategorias.length;
                                  index++)
                                Row(
                                  children: [
                                    Checkbox(
                                      value:
                                          _listaDeCategoriasSelecionadas[index],
                                      onChanged: (bool? value) {
                                        if (value is bool) {
                                          setState(() {
                                            _listaDeCategoriasSelecionadas[
                                                index] = value;
                                          });
                                        }
                                      },
                                    ),
                                    Text(_listaDeCategorias[index].nome!),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
              ],
            ),
            //08 - Capturas de Imagens
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
                                      child: kIsWeb
                                          ? Image.network(xFile.path)
                                          : Image.file(File(xFile.path)),
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
                              final listaDeCategorias = <Categoria>[];

                              for (int index = 0;
                                  index < listaDeCategorias.length;
                                  index++) {
                                if (_listaDeCategoriasSelecionadas[index]) {
                                  listaDeCategorias
                                      .add(_listaDeCategorias[index]);
                                }
                              }

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
                                listaDeCategorias: listaDeCategorias,
                              );

                              final listaDeStringsComNomesDosArquivos =
                                  <String>[];

                              try {
                                await FirebaseFirestore.instance
                                    .collection('produtos')
                                    .count()
                                    .get()
                                    .then((AggregateQuerySnapshot
                                        aggregateQuerySnapshot) {
                                  int quantidade = aggregateQuerySnapshot.count;
                                  produto.id = ++quantidade;
                                });

                                int countImagens = 0;

                                for (XFile xFile in _imagensDoProduto) {
                                  countImagens++;

                                  listaDeStringsComNomesDosArquivos
                                      .add(countImagens.toString());

                                  final storegeRef = FirebaseStorage.instance
                                      .ref()
                                      .child('produtos')
                                      .child(produto.id.toString())
                                      .child('${countImagens.toString()}.png');

                                  kIsWeb
                                      ? await storegeRef
                                          .putData(await xFile.readAsBytes())
                                      : await storegeRef
                                          .putFile(File(xFile.path));
                                }

                                produto.listaDeArquivos =
                                    listaDeStringsComNomesDosArquivos;
                                await FirebaseFirestore.instance
                                    .collection('produtos')
                                    .doc(produto.id.toString())
                                    .set(produto.toFirestore())
                                    .onError((error, _) => debugPrint(
                                        'Erro ao criar Produto: $error'))
                                    .then((value) =>
                                        debugPrint('Sucesso ao enviar dados!'));
                                // ignore: use_build_context_synchronously
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TelaHome()));
                              } catch (e) {
                                debugPrint(e.toString());
                              }
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
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const TelaHome()));
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
