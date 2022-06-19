import 'package:flutter/material.dart';
import 'package:robotica/screens/FirstPage/components/body.dart';

class FirstPage extends StatelessWidget{
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
} 
