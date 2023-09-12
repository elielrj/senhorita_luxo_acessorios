import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:senhorita_luxo_acessorios/firebase_options.dart';
import 'package:senhorita_luxo_acessorios/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore db = FirebaseFirestore.instance;

  // Create a new user with a first and last name
  final user = <String, dynamic>{
    "first": "Ada",
    "last": "Lovelace",
    "born": 1815
  };

// Add a new document with a generated ID
  await db.collection("users").add(user).then((DocumentReference doc) =>
      print('DocumentSnapshot added with ID: ${doc.id}'));

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      //theme: ThemeData(fontFamily: 'Hello'),
    ),
  );
}
