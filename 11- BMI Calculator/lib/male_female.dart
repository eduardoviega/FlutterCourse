import 'package:flutter/material.dart';
import 'constants.dart';

class MaleFemale extends StatelessWidget {
  MaleFemale({required this.iconML, required this.textML});

  final IconData iconML;
  final String textML;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconML,
          size: 70.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          textML,
          style: kTextStyle,
        ),
      ],
    );
  }
}
