import 'package:flutter/material.dart';
import 'package:senhorita_luxo_acessorios/library/inicializar_firebase_no_app.dart';
import 'package:senhorita_luxo_acessorios/view/splash.dart';

void main() async {
  await inicializarFirebaseNoApp();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    ),
  );
}
