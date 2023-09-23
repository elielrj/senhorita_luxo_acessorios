import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TelaImagemCardTop extends StatefulWidget {
  const TelaImagemCardTop({super.key});

  @override
  State<TelaImagemCardTop> createState() => _TelaImagemCardTopState();
}

class _TelaImagemCardTopState extends State<TelaImagemCardTop> {
  late PageController _controller;
  final _listaDeImagens = <XFile>[];

  @override
  void initState() {
    _controller = PageController();
    super.initState();
    _listaDeImagens.add(XFile('imagens/carrocel/shopping1.png'));
    _listaDeImagens.add(XFile('imagens/carrocel/shopping2.png'));
    _listaDeImagens.add(XFile('imagens/carrocel/shopping3.png'));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              children: [
                for (XFile xFile in _listaDeImagens)/*
                  kIsWeb
                      ? Image.network(file.path)
                      : Image.file(File(file.path))*/
                  Image.asset(xFile.path,fit: BoxFit.cover,)
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.75),
              child: SmoothPageIndicator(
                controller: _controller,
                count: _listaDeImagens.length,
                onDotClicked: (index) => _controller.jumpToPage(index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
