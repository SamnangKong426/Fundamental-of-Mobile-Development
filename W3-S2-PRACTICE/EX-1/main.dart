import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
          body: Center(
        child: Text(
          "Beyonce is the best!",
          style: TextStyle(fontSize: 50, color: Colors.orange),
        ),
      )),
    ),
  );
}