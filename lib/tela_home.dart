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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.10 / 4,
              right: MediaQuery.of(context).size.width * 0.10 / 4,
              top: 16,
              bottom: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.90,
                  //height: 300,
                  child: Container(
                    color: corVerdeClaroSecundAriaDaSenhoritaLuxoAcessorios,
                    child: const TelaDeProdutos(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
