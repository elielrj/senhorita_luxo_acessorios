

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Arquivo{

  String? nome;
  DateTime? dataHoraUpload;
  DocumentReference? path;

  Arquivo({this.nome, this.dataHoraUpload, this.path});


}