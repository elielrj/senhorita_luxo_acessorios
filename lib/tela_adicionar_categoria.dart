import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/cores/cores.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/textos/textos.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Categoria.dart';
import 'package:senhorita_luxo_acessorios/tela_home.dart';

class TelaAdicionarCategoria extends StatefulWidget {
  const TelaAdicionarCategoria({super.key});

  @override
  State<TelaAdicionarCategoria> createState() => _TelaAdicionarCategoriaState();
}

class _TelaAdicionarCategoriaState extends State<TelaAdicionarCategoria> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corRosaPrincipalDaSenhoritaLuxoAcessorios,
      appBar: AppBar(
        title: const Text(textoAdicionarCategoria),
        backgroundColor: corRosaPrincipalDaSenhoritaLuxoAcessorios,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Descrição'),
              maxLength: 100,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8.0, bottom: 32, right: 8, left: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Botão Enviar
                    Expanded(
                      child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.blueGrey,
                            padding: const EdgeInsets.all(16),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () async {
                            final categoria =
                                Categoria(descricao: _controller.text);

                            try {
                              await FirebaseFirestore.instance
                                  .collection('categorias')
                                  .doc(_controller.text.toString().toLowerCase())
                                  .set(categoria.toMap())
                                  .onError((error, _) => debugPrint(
                                      'Erro ao gravar uma categoria: $error'))
                                  .then((value) => debugPrint(
                                      'Sucesso ao gravar uma categoria!'));
                              // ignore: use_build_context_synchronously
                              Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const TelaHome()));
                            } catch (e) {
                              debugPrint(e.toString());
                            }
                          },
                          child: const Text(textoEnviar)),
                    ),
                    const SizedBox(width: 8),
                    //Botão Cancelar
                    Expanded(
                      child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.blueGrey,
                            padding: const EdgeInsets.all(16),
                            textStyle: const TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TelaHome()));
                          },
                          child: const Text(textoCancelar)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
