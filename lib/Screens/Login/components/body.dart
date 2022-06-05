import 'package:flutter/material.dart';
import 'package:robotica/Screens/Login/components/background.dart';
import 'package:robotica/Screens/Login/components/rounded_input_field.dart';
import 'package:robotica/Screens/Signup/signup_screen.dart';
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
            const Text(
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),            
            ),
            SizedBox(
              height: size.height * .03,
            ),
            Image.asset(
              'imgs/robotic_class.jpg',
              height: size.height *.35,
            ),
            SizedBox(
              height: size.height * .03,
            ),
            RoundedInputField(
              hintText: 'Seu melhor e-mail',
              onChanged: (value) {
              },
            ),
            RoundedPasswordField(
              onChanged: (
                value
              ) {},
            ),
            RoundedButton(
              text: 'LOGIN',
              press: () {},
            ),
            SizedBox(
              height: size.height * .03,
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
          ],
        ),
      ),
    );
  }
}
