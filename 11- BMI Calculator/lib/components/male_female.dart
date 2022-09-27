import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class MaleFemale extends StatelessWidget {
  const MaleFemale({super.key, required this.iconML, required this.textML});

  final IconData iconML;
  final String textML;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconML, size: 70.0),
        const SizedBox(height: 15.0),
        Text(textML, style: kTextStyle),
      ],
    );
  }
}
