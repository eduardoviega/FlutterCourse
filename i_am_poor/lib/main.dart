import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('I Am Poor'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: const Center(
        child: Image(image: AssetImage('images/wallet.png')),
      ),
    ),
  ));
}
