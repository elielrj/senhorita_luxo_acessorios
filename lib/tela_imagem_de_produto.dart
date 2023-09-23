import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class TelaImagemDeProduto extends StatefulWidget {
  const TelaImagemDeProduto({super.key, required this.codigo, required this.nome});

  final String codigo;
  final String nome;

  @override
  State<TelaImagemDeProduto> createState() => _TelaImagemDeProdutoState();
}

class _TelaImagemDeProdutoState extends State<TelaImagemDeProduto> {
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
        //: Image.network(imagemUrl!);
        : Image.network(imagemUrl!);
  }
}
