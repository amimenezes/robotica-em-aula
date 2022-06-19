import 'package:flutter/material.dart';
import 'package:robotica/screens/Login/login_sreen.dart';
import 'package:robotica/screens/Signup/signup_screen.dart';
import 'package:robotica/screens/Welcome/components/background.dart';
import 'package:robotica/components/rounded_button.dart';
import 'package:robotica/constants.dart';
import 'background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Robo4Share".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/imgs/screen_welcome.png',
                height: size.height * 0.45,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ButtonTheme(
              minWidth: 200.0,
              height: 20,
              child: RoundedButton(
                text: 'ENTRAR',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)
                      {
                        return const LoginScreen();
                      },
                    ),
                  );
                },
              ),
            ),
            RoundedButton(
              text: 'CADASTRAR-SE',
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)
                    {
                      return const SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
