import 'package:flutter/material.dart';
import 'package:robotica/constants.dart';
import 'Screens/Welcome/welcome_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Login',
      theme: ThemeData(
        primaryColor: kPrimaryLightColor,
        //scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 0)
      ),
      home: const WelcomeScreen(),
    );
  }
}
