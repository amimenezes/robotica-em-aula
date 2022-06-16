import 'package:flutter/material.dart';
import 'package:robotica/Screens/Projetos/components/body.dart';

class Projetos extends StatelessWidget{
  const Projetos({Key? key}) : super(key: key);

  //_MyAppState createState() => _MyAppState();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyProjetos(),
    );
  }
} 
