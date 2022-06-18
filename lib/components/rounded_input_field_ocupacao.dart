import 'package:flutter/material.dart';
import 'package:robotica/components/text_field_container.dart';
import 'package:robotica/constants.dart';

class RoundedInputFieldOcupacao extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputFieldOcupacao({
    Key? key,
    required this.hintText,
    this.icon = Icons.workspaces_outline,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}