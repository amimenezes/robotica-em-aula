import 'package:flutter/material.dart';
import 'package:robotica/Screens/FirstPage/components/background.dart';
import 'package:robotica/components/button_funcionalidades.dart';

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
              'BEM-VIND@S',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: size.height * .03,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/imgs/father_and_son_making_robot.jpg',
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

                    },
                  ),
                ),
                RoundedButtonFuncionalidades(
                  text: 'Projetos'.toUpperCase(),
                  press: () {
                    
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
