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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                EdgeInsets.all(MediaQuery.of(context).size.width * 0.10 / 4),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.40,
              height: 300,
              child: Container(
                color: corVerdeClaroSecundAriaDaSenhoritaLuxoAcessorios,
                child: const TelaDeProdutos(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
