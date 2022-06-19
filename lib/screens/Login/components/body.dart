import 'package:flutter/material.dart';
import 'package:robotica/screens/FirstPage/first_page.dart';
import 'package:robotica/screens/Login/components/background.dart';
import 'package:robotica/screens/Login/components/rounded_input_field.dart';
import 'package:robotica/screens/Signup/signup_screen.dart';
import 'package:robotica/components/already_have_an_account_acheck.dart';
import 'package:robotica/components/rounded_button.dart';
import 'package:robotica/components/rounded_password_field.dart';

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
            Text(
              'LOGIN'.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: size.height * .03,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: SizedBox.fromSize(
                child: Image.asset(
                  'assets/imgs/screen_login.png',
                  height: size.height * 0.32,
                ),
              ),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            RoundedInputField(
              hintText: 'Seu e-mail',
              onChanged: (value) {
              },
            ),
            RoundedPasswordField(
              onChanged: (
                value
              ) {},
              hintText: '',
              
            ),
            RoundedButton(
              text: 'ENTRAR',
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)
                    {
                      return const FirstPage();
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: size.height * .02,
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){
                      return const SignUpScreen();
                    },
                  ),
                );
              },            
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
