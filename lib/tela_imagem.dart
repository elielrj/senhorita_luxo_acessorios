import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class TelaImagem extends StatefulWidget {
  const TelaImagem({super.key, required this.codigo, required this.nome});

  final String codigo;
  final String nome;

  @override
  State<TelaImagem> createState() => _TelaImagemState();
}

class _TelaImagemState extends State<TelaImagem> {
  String? imagemUrl;

  Future<void> buscarImagem() async {
    String url = await FirebaseStorage.instance
        .ref()
        .child('produtos')
        .child(widget.codigo)
        .child('${widget.nome}.png')
        .getDownloadURL();
    debugPrint('URL: $url');
    setState(() {
      imagemUrl = url;
    });
  }

  @override
  void initState() {
    super.initState();
    buscarImagem();
  }

  @override
  Widget build(BuildContext context) {
    return imagemUrl == null
        ? Container(
            color: Colors.grey,
          )
        : Image.network(imagemUrl!);
  }
}
