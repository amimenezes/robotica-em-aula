import 'package:flutter/material.dart';
import 'package:robotica/screens/FirstPage/components/background.dart';
import 'package:robotica/screens/Grupos/grupos.dart';
import 'package:robotica/screens/Projetos/projetos.dart';
import 'package:robotica/components/button_funcionalidades.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

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
              'Bem-vind@s'.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: size.height * .03,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/imgs/screen_first_page.png',
                height: size.height * 0.27,
              ),
            ),
            SizedBox(
              height: size.height * .03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: RoundedButtonFuncionalidades(
                    text: 'Grupos'.toUpperCase(),
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (contex) {
                        return const Grupos();
                      }));
                    },
                  ),
                ),
                RoundedButtonFuncionalidades(
                  text: 'Projetos'.toUpperCase(),
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const Projetos();
                      }),
                    );
                  },
                ),
              ],
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
