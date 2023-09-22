import 'package:flutter/material.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/cores/cores.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/textos/textos.dart';
import 'package:senhorita_luxo_acessorios/tela_adicionar_produto.dart';
import 'package:senhorita_luxo_acessorios/tela_de_produtos.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corRosaPrincipalDaSenhoritaLuxoAcessorios,
      appBar: AppBar(
        title: const Text(
          textoSenhoritaLuxoAcessorios,
          style: TextStyle(
              color: corVerdeClaroSecundAriaDaSenhoritaLuxoAcessorios),
        ),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: corVerdeClaroSecundAriaDaSenhoritaLuxoAcessorios,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
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
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: corVerdeClaroSecundAriaDaSenhoritaLuxoAcessorios,
            ),
            tooltip: textoConfiguracoes,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(textoConfiguracoes)));
            },
          ),
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
              child: Container(color: Colors.blue),
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
              title: const Row(children: [
                Icon(Icons.add, color: Colors.black),
                Text(
                  textoProduto,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TelaAdicionarProduto()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
