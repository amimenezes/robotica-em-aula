import 'package:flutter/material.dart';
import 'package:robotica/components/text_field_container.dart';
import 'package:robotica/constants.dart';

class RoundedPasswordRepeatField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordRepeatField({
    Key? key,
    required this.onChanged, required String hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: const InputDecoration(
          hintText: 'Repita sua senha',
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffix: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
