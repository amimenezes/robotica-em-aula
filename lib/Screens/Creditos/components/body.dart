import 'package:flutter/material.dart';
import 'package:robotica/Screens/Creditos/components/background.dart';
import 'package:robotica/components/rounded_button.dart';

class Body extends StatelessWidget {
  const Body(
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
            const Text(
              'CRÉDITOS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: size.height * .03,
            ),
            //Uri(
              //path: 'https://br.freepik.com/fotos-vetores-gratis/laptop',
              //query: 'subject': 'Laptop foto criado por freepik - br.freepik.com',
            //),
            RoundedButton(
              text: 'Projetos',
              press: () {},
            ),
            SizedBox(
              height: size.height * .02,
            ),
          ],
        ),
      ),
    );
  }
}
