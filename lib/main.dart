import 'package:flutter/material.dart';
import 'package:robotica/Screens/Welcome/welcome_screen.dart';
import 'package:robotica/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RC4 Login',
      theme: ThemeData(
        primaryColor: kPrimaryLightColor,
        //scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 0)
      ),
      home: const WelcomeScreen(),
    );
  }
}
