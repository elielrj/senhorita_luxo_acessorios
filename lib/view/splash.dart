import 'dart:async';

import 'package:flutter/material.dart';
import 'package:senhorita_luxo_acessorios/common/colors.dart';
import 'package:senhorita_luxo_acessorios/common/images.dart';
import 'package:senhorita_luxo_acessorios/view/senhorita_luxo_acessorios.dart';

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
          color: COLOR_PRINCIPAL_SL,
          padding: const EdgeInsets.all(60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                FUNDO_ROSA_LETRAS_BRANCAS_NO_LOGO,
                width: 270,
                height: 270,
              ),
              Image.asset(
                UM_ACESSORIO_MUDA_TUDO_VERDE_LOGO,
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
