import 'package:flutter/material.dart';
import 'package:robotica/screens/Projetos/components/projeto_list.dart';
//import 'package:robotica/screens/Projetos/components/projeto_grouped_list.dart';

class Projetos extends StatelessWidget {
  const Projetos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyProjetosList(),
      //body: BodyProjetosGroupedList(),
    );
  }
}
