

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Arquivo{

  String? nome;
  DateTime? dataHoraUpload;
  String? path;//todo mudar para DocumentReference

  Arquivo({this.nome, this.dataHoraUpload, this.path});

factory Arquivo.fromMap(Map<String, dynamic>? map){
  return Arquivo(
    nome: map?['nome'],
    dataHoraUpload: (map?['data_hora_upload'] as Timestamp).toDate(),
    path: map?['path'],
  );
  }
}