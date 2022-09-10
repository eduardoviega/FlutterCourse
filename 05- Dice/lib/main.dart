import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Center(child: Text('Dice')),
          backgroundColor: Colors.red,
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  late int leftButtonNumber;
  late int rightButtonNumber;

  void randomNumber() {
    setState(() {
      leftButtonNumber = Random().nextInt(6) + 1;
      rightButtonNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    randomNumber();
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                randomNumber();
              },
              child: Image.asset('images/dice$leftButtonNumber.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                randomNumber();
              },
              child: Image.asset('images/dice$rightButtonNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
