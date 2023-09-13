import 'package:flutter/material.dart';
import 'package:senhorita_luxo_acessorios/common/images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carrocel extends StatefulWidget {
  const Carrocel({super.key});

  @override
  State<Carrocel> createState() => _CarrocelState();
}

class _CarrocelState extends State<Carrocel> {
  late PageController _pageController;

  List<Image> listaDeImagens = [
    Image.asset(
      SHOPPING_1,
      fit: BoxFit.cover,
      height: 200,
    ),
    Image.asset(
      SHOPPING_2,
      fit: BoxFit.cover,
      height: 200,
    ),
    Image.asset(
      SHOPPING_3,
      fit: BoxFit.cover,
      height: 200,
    )
  ];

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      PageView(
        controller: _pageController,
        children: listaDeImagens
            .map((imagem) => Container(
                  child: imagem,
                ))
            .toList(),
      ),
      Container(
        alignment: const Alignment(0, 0.85),
        child: SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            onDotClicked: (index) {
              _pageController.jumpToPage(index);
            }),
      ),
    ]);
  }
}
