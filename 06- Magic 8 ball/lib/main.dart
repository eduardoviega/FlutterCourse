import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Center(child: Text('Ask Me Anything')),
          backgroundColor: Colors.blue[900],
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
  late int imageNumber;

  void changeImage() {
    setState(() {
      imageNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    changeImage();
    return Center(
      child: TextButton(
        onPressed: () {
          changeImage();
        },
        child: Image.asset('images/ball$imageNumber.png'),
      ),
    );
  }
}
