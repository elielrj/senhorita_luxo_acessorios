import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/cores/cores.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/imagens.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/textos/textos.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Categoria.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Departamento.dart';
import 'package:senhorita_luxo_acessorios/tela_adicionar_categoria.dart';
import 'package:senhorita_luxo_acessorios/tela_adicionar_departamento.dart';
import 'package:senhorita_luxo_acessorios/tela_adicionar_produto.dart';
import 'package:senhorita_luxo_acessorios/tela_de_produtos.dart';
import 'package:senhorita_luxo_acessorios/tela_imagem_card_top.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  final _listaDeCategorias = <Categoria>[];
  final _listaDeDepartamentos = <Departamento>[];

  Future<void> _buscarCategorias() async {
    await FirebaseFirestore.instance
        .collection('categorias')
        .get()
        .then((QuerySnapshot querySnapshot) async {
      for (QueryDocumentSnapshot query in querySnapshot.docs) {
        final data = query.data() as Map<String, dynamic>;
        _listaDeCategorias.add(Categoria.fromMap(data));
      }
    });
    setState(() => _listaDeCategorias);
  }

  Future<void> _buscarDepartamentos() async {
    await FirebaseFirestore.instance
        .collection('departamentos')
        .get()
        .then((QuerySnapshot querySnapshot) async {
      for (QueryDocumentSnapshot query in querySnapshot.docs) {
        final data = query.data() as Map<String, dynamic>;
        _listaDeDepartamentos.add(Departamento.fromMap(data));
      }
    });
    setState(() => _listaDeDepartamentos);
  }

  @override
  void initState() {
    super.initState();
    _buscarCategorias();
    _buscarDepartamentos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corRosaPrincipalDaSenhoritaLuxoAcessorios,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 8, left: 8),
          child: Row(
            mainAxisAlignment:
                kIsWeb ? MainAxisAlignment.start : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                fundoTransparenteLetrasBrancas,
                height: 70,
                width: 50,
              ),
              const Text(
                textoSenhoritaLuxoAcessorios,
                style: TextStyle(
                    color: corVerdeClaroSecundAriaDaSenhoritaLuxoAcessorios,
                    fontSize: 16),
              ),
              kIsWeb
                  ? Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 32,
                          ),
                          for (Departamento departamento
                              in _listaDeDepartamentos)
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  departamento.nome.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    )
                  : Container(width: 0),
            ],
          ),
        ),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: corVerdeClaroSecundAriaDaSenhoritaLuxoAcessorios,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: corVerdeClaroSecundAriaDaSenhoritaLuxoAcessorios,
            ),
            tooltip: textoMeuCarrinho,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(textoMeuCarrinho)));
            },
          ),
          kIsWeb
              ? IconButton(
                  icon: const Icon(
                    Icons.settings,
                    color: corVerdeClaroSecundAriaDaSenhoritaLuxoAcessorios,
                  ),
                  tooltip: textoConfiguracoes,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text(textoConfiguracoes)));
                  },
                )
              : const SizedBox(),
        ],
        backgroundColor: corRosaPrincipalDaSenhoritaLuxoAcessorios,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Container(
                color: corVerdeClaroSecundAriaDaSenhoritaLuxoAcessorios,
                child: const TelaImagemCardTop(),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 600,
              child: SingleChildScrollView(child: TelaDeProdutos()),
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Container(color: Colors.green),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: corVerdeClaroSecundAriaDaSenhoritaLuxoAcessorios,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: corRosaPrincipalDaSenhoritaLuxoAcessorios,
              ),
              child: Text(textoCategorias),
            ),
            ListTile(
              title: const Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.add, color: Colors.black),
                        Text(
                          textoProduto,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ]),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TelaAdicionarProduto()));
              },
            ),
            ListTile(
              title: const Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.add, color: Colors.black),
                        Text(
                          textoCategoria,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ]),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TelaAdicionarCategoria()));
              },
            ),
            ListTile(
              title: const Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.add, color: Colors.black),
                        Text(
                          textoDepartamento,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ]),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const TelaAdicionarDepartamento()));
              },
            ),
            for (Departamento departamento in _listaDeDepartamentos)
              ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        departamento.nome.toString(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                onTap: () {},
              )
          ],
        ),
      ),
    );
  }
}
