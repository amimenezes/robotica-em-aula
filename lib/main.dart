//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:robotica/home.dart';

void main() async {
  // Inicia o Firebase
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();  
  // FirebaseFirestore.instance
  //   .collection('Usuarios')
  //   .doc('001')
  //   .set(
  //     {
  //       'nome': 'Michele',
  //     }
  //   );

  runApp(const MaterialApp(
    title: "Home",
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}
