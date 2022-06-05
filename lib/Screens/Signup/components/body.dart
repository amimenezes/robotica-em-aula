import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:robotica/Screens/Login/components/rounded_input_field.dart';
import 'package:robotica/Screens/Login/login_sreen.dart';
import 'package:robotica/Screens/Signup/components/background.dart';
import 'package:robotica/Screens/Signup/components/or_divider.dart';
import 'package:robotica/Screens/Signup/components/social_icon.dart';
import 'package:robotica/components/already_have_an_account_acheck.dart';
import 'package:robotica/components/rounded_button.dart';
import 'package:robotica/components/rounded_password_field.dart';

class Body extends StatelessWidget {

  const Body (
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
              'CADASTRE-SE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * .03,
            ),
            SvgPicture.asset(
              'icons/signup.svg',
              height: size.height * .35,
      
            ),
            SizedBox(
              height: size.height * .03,
            ),
            RoundedInputField(
              hintText: 'Seu e-mail',
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: 'CADASTRAR',
              press: () {},
            ),
            SizedBox(
              height: size.height * .03,
            ),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  )
                );
              },
            ),
            const OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: 'icons/facebook.svg',
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: 'icons/twitter.svg',
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: 'icons/google-plus.svg',
                  press: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
