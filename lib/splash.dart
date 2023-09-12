import 'dart:async';

import 'package:flutter/material.dart';
import 'package:senhorita_luxo_acessorios/configuracoes.dart';
import 'package:senhorita_luxo_acessorios/senhorita_luxo_acessorios.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const SenhoritaLuxoAcessorios()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          color: Configuracoes.COLOR_PRINCIPAL_SL,
          padding: const EdgeInsets.all(60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'imagens/sl-acessorios/fundo-rosa-letras-brancas-logo.png',
                width: 270,
                height: 270,
              ),
              Image.asset(
                'imagens/um-acessorio-muda-tudo/um-acessorio-muda-tudo-verde-logo.png',
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
