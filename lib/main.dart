import 'package:flutter/material.dart';
import 'package:robotica/home.dart';
// ignore: import_of_legacy_library_into_null_safe
//import 'package:cloud_firestore/cloud_firestore.dart';

void main() {

  // Inicia o Firebase
  WidgetsFlutterBinding.ensureInitialized();

// Firestore.instance
//   .collection("Usuarios")
//   .document("Pontuação")
//   .setData(
//     {
//       "Michele": "05",
//       "Lady Gaga" : "10",
//     }
//   );

  runApp(
    const MaterialApp(
      title: "Home",
      home: Home(),
      debugShowCheckedModeBanner: false,
    )    
  );
}
