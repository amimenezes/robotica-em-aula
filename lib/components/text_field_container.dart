import 'package:flutter/material.dart';
import 'package:robotica/constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
    //required List<Widget> children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 0.25,
      ),
      width: size.width * .8,
      height: size.height * .07,
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}
