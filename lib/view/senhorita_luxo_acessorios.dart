import 'package:flutter/material.dart';
import 'package:senhorita_luxo_acessorios/carrocel.dart';
import 'package:senhorita_luxo_acessorios/common/colors.dart';
import 'package:senhorita_luxo_acessorios/common/images.dart';
import 'package:senhorita_luxo_acessorios/common/texts.dart';

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
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(
                FUNDO_ROSA_LETRAS_BRANCAS_NO_LOGO,
                width: 30,
                height: 30,
              ),
            ),
            const Text(SENHORITA_LUXO_ACESSORIOS),
          ],
        ),
        backgroundColor: COLOR_PRINCIPAL_SL,
      ),
      body: Container(
          padding: const EdgeInsets.all(0),
          color: COLOR_SECUNDARIA_SL,
          //width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /**
                   * BODY está dividido em 3 partes: top, midle e footer
                   */
                  /**
                   * TOP
                   */
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: const Carrocel(),
                  ),
                  /**
                   * MIDLE
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
                                    child: Column(
                                      children: [
                                        Text('Nome'),
                                        Text('Código'),
                                        Text('Estoque'),
                                        Text('Arquivo'),
                                        Text('Curtida'),
                                        Text('Visualizações'),
                                        Text('Avaliação'),
                                        Text('Categoria'),
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
                  /**
                   * FOOTER
                   */
                  const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 16),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Sobre'),
                                          Text('Nossa Loja'),
                                          Text('Privacidade'),
                                          Text('Atacado'),
                                          Text('Blog'),
                                        ]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Ajuda'),
                                          Text('Meus Pedidos'),
                                          Text('Devolução'),
                                          Text('Promoções'),
                                          Text('Cupons'),
                                        ]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Parcerias'),
                                          Text('Influencers'),
                                          Text('Franquia'),
                                          Text('Trabalhe conosco')
                                        ]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Mais Buscados'),
                                          Text('Piercing'),
                                          Text('Brincos Femininos'),
                                          Text('Choker'),
                                          Text('Pulseira'),
                                          Text('Argolinha'),
                                        ]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Categoria'),
                                          Text('Acessórios'),
                                          Text('Anéis'),
                                          Text('Chokers'),
                                          Text('Colares'),
                                        ]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('(48) 9 9999 9999)'),
                                          Text('(48) 8 8888 8888)'),
                                          Text('Contato via e-mail'),
                                          Text('Seg à Sex, das 8:30 às 18:30h'),
                                        ]),
                                  ),
                                ]),
                          ),
                        ),
                      ]),
                ]),
          )),
      bottomNavigationBar: BottomAppBar(
        color: COLOR_PRINCIPAL_SL,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(COLOR_SECUNDARIA_SL)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const SenhoritaLuxoAcessorios()));
                },
                child: const Icon(
                  Icons.home,
                  color: COLOR_SECUNDARIA_SL,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
