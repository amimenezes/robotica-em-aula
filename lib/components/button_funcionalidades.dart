import 'package:flutter/material.dart';
import 'package:robotica/constants.dart';

class RoundedButtonFuncionalidades extends StatelessWidget {
  final String text;
  final Function() press;
  final Color color, textColor;
  const RoundedButtonFuncionalidades({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width *0.41,
      height: size.height *0.15,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: newElevatedButton(),
      )
    );
  }

  Widget newElevatedButton(){
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 40,
        ),
        textStyle: TextStyle(
          color: color,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor
        ),
      ),
    );
  }
}

