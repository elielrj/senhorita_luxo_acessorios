import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:senhorita_luxo_acessorios/tela_home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaHome(),
    ),
  );
}
