import 'package:flutter/material.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/cores/cores.dart';
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
              height: 400,
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
    );
  }
}
