import 'package:flutter/material.dart';
import 'package:robotica/Screens/Signup/components/background.dart';

class ProjetoView extends StatelessWidget {

  const ProjetoView (
    {
      Key? key,
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: size.height * .10,
            ),
            Text(
              // Nome do Projeto
              'Teste Abrir Projeto'.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
