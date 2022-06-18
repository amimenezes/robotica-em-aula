import 'package:flutter/material.dart';
import 'package:robotica/Screens/Login/login_sreen.dart';
import 'package:robotica/Screens/Signup/components/background.dart';
import 'package:robotica/Screens/Signup/components/or_divider.dart';
import 'package:robotica/Screens/Signup/components/social_icon.dart';
import 'package:robotica/components/already_have_an_account_acheck.dart';
import 'package:robotica/components/rounded_button.dart';
import 'package:robotica/components/rounded_input_field_email.dart';
import 'package:robotica/components/rounded_input_field_name.dart';
import 'package:robotica/components/rounded_input_field_ocupacao.dart';
import 'package:robotica/components/rounded_password_field.dart';
import 'package:robotica/components/rounded_password_repeat_field.dart';

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
              'Cadastre-se'.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            ClipRRect(
              //borderRadius: BorderRadius.circular(50),
              child: SizedBox.fromSize(
                child: Image.asset(
                  'assets/imgs/screen_registration.png',
                  height: size.height * .20,
                ),
              ),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            RoundedInputFieldName(
              hintText: 'Seu nome completo',
              onChanged: (value) {},
            ),
            RoundedInputFieldEmail(
              hintText: 'Seu melhor e-mail',
              onChanged: (value) {},
            ),
            RoundedInputFieldOcupacao(
              hintText: 'Ocupação',
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: 'Sua senha',
              onChanged: (value) {},
            ),
            RoundedPasswordRepeatField(
              hintText: 'Repita sua senha',
              onChanged: (value) {},
            ),
            RoundedButton(
              text: 'CADASTRAR',
              press: () {},
            ),
            SizedBox(
              height: size.height * .01,
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ));
              },
            ),
            const OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: 'assets/icons/facebook.svg',
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: 'assets/icons/twitter.svg',
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: 'assets/icons/google-plus.svg',
                  press: () {},
                ),
              ],
            ),
            SizedBox(
              height: size.height * .03,
            ),
          ],
        ),
      ),
    );
  }
}
