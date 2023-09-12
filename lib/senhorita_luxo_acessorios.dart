import 'package:flutter/material.dart';
import 'package:senhorita_luxo_acessorios/configuracoes.dart';

class SenhoritaLuxoAcessorios extends StatefulWidget {
  const SenhoritaLuxoAcessorios({super.key});

  @override
  State<SenhoritaLuxoAcessorios> createState() =>
      _SenhoritaLuxoAcessoriosState();
}

class _SenhoritaLuxoAcessoriosState extends State<SenhoritaLuxoAcessorios> {
  List<Widget> categorias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /**
       * app-bar
       */
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(
                'imagens/sl-acessorios/fundo-rosa-letras-brancas-logo.png',
                width: 30,
                height: 30,
              ),
            ),
            const Text('Senhorita Luxo Acessórios'),
          ],
        ),
        backgroundColor: Configuracoes.COLOR_PRINCIPAL_SL,
      ),
      /**
       * body:
       *      - body-top
       *      - body-midle
       *      - body-footer
       */
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(0),
          color: Configuracoes.COLOR_SECUNDARIA_SL,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /**
                   * body-top
                   */
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        'imagens/carrocel/shopping1.png',
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                    ],
                  ),
                  /**
                   * body-midle
                   */
                  Column(
                    children: [
                      for (int i = 0; i <= 1; i++)
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    color: Colors.white,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: 200,
                                    child: const Text('d x zxzczcxzc'),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    color: Colors.white,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: 200,
                                    child: const Text('d'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                  /**
                   * body-footer
                   *
                   * Recebe uma lista de Widgets Text, e cria um ScrollView Lateral
                   * [
                   *  [0] => [
                   *           'nome-da-categoria' => 'Brinco'
                   *           'link' => 'DocumenttReferemce'
                   *           [0] =>
                   *                [
                   *                  1 =>'Pequeno',
                   *                  'nome'=>'Grande'
                   *                ]
                   *         ]
                   *
                   *  [1] => [
                   *           'nome' => 'Colar'
                   *           'link' => 'DocumenttReferemce'
                   *         ]
                   *
                   * ]
                   */

                  const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 8.0, bottom: 16),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                  Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Brincos'),
                                        Text('Brincos'),
                                        Text('Choker'),
                                        Text('Pulseira'),
                                        Text('Argolinha'),
                                      ]),
                              ]),
                        ),
                      ]),
                ]),
          ),
        ),
      ),
      /**
       * bootom-navigattion-bar
       */
      bottomNavigationBar: BottomAppBar(
        color: Configuracoes.COLOR_PRINCIPAL_SL,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Configuracoes.COLOR_SECUNDARIA_SL)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SenhoritaLuxoAcessorios()));
                },
                child: const Icon(
                  Icons.home,
                  color: Configuracoes.COLOR_SECUNDARIA_SL,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
