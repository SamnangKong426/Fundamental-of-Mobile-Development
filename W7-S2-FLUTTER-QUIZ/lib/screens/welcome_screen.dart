import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(
      {super.key, required this.onStart, required this.quizTitle});

  final String image = "lib/W7-S2-FLUTTER-QUIZ/assets/quiz-logo.png";
  final VoidCallback onStart;
  final String quizTitle;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 500, 
        child: Image.asset(
          image,
          scale: 2.0, 
          fit: BoxFit.cover, 
        ),
      ),
      const SizedBox(height: 20),
      Text(
        quizTitle,
        style: const TextStyle(fontSize: 30, color: Colors.white),
      ),
      const SizedBox(height: 40),
      Center(
        child: SizedBox(
          width: 200, 
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  vertical: 15),
              textStyle: const TextStyle(fontSize: 18), 
            ),
            onPressed: () {
              onStart();
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_forward),
                SizedBox(width: 10),
                Text('Start Quiz'),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
