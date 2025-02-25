import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: Text(
                "OOP",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: Text(
                "DART",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Center(
              child: Text(
                "FLUTTER",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  ));
}
