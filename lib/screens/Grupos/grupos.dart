import 'package:flutter/material.dart';
import 'package:robotica/screens/Grupos/components/grupo_list.dart';
//import 'package:robotica/screens/Grupos/components/grupo_grouped_list.dart';

class Grupos extends StatelessWidget {
  const Grupos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyGruposList(),
      //body: BodyGruposGroupedList(),
    );
  }
}
