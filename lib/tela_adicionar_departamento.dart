import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/cores/cores.dart';
import 'package:senhorita_luxo_acessorios/bibioteca/textos/textos.dart';
import 'package:senhorita_luxo_acessorios/model/bo/produto/Departamento.dart';
import 'package:senhorita_luxo_acessorios/tela_home.dart';

class TelaAdicionarDepartamento extends StatefulWidget {
  const TelaAdicionarDepartamento({super.key});

  @override
  State<TelaAdicionarDepartamento> createState() =>
      _TelaAdicionarDepartamentoState();
}

class _TelaAdicionarDepartamentoState extends State<TelaAdicionarDepartamento> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(textoAdicionarDepartamento),
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
                            final departamento =
                                Departamento(nome: _controller.text);

                            try {
                              await FirebaseFirestore.instance
                                  .collection('departamentos')
                                  .count()
                                  .get()
                                  .then((AggregateQuerySnapshot
                                      aggregateQuerySnapshot) {
                                int quantidade = aggregateQuerySnapshot.count;
                                departamento.id = ++quantidade;
                              });

                              await FirebaseFirestore.instance
                                  .collection('departamentos')
                                  .doc(departamento.id.toString())
                                  .set(departamento.toMap())
                                  .onError((error, _) => debugPrint(
                                      'Erro ao gravar um departamento: $error'))
                                  .then((value) => debugPrint(
                                      'Sucesso ao gravar um departamento!'));
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
