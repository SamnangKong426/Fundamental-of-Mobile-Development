// Start from the exercice 3 code

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          CustomCard("OOP", color: Colors.blue[100]),
          CustomCard("DART", color: Colors.blue[300]),
          CustomCard(
            "FLUTTER",
            color: Colors.blue[600],
          ),
          const CustomCard.gradientColors("Colors",
              start: Colors.red, end: Colors.blue),
        ],
      ),
    ),
  ));
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? start;
  final Color? end;

  const CustomCard(this.text, {super.key, this.color, this.start, this.end});
  const CustomCard.gradientColors(this.text,
      {super.key, this.start, this.end, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // check if user use named Contructor
        gradient: (start != null && end != null)
            ? LinearGradient(
                colors: [start!, end!],
              )
            : null,
        color: (start == null && end == null) ? color : null,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            decoration: TextDecoration.none,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
