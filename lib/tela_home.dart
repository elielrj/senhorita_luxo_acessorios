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
        title: const Text(textoSenhoritaLuxoAcessorios),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: textoMeuCarrinho,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(textoMeuCarrinho)));
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
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
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: TextButton(
                child: const Row(children: [
                  Icon(Icons.add),
                  Text(textoProduto),
                ]),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TelaAdicionarProduto())),
              ),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
