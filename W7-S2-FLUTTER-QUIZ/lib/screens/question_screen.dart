import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7-S2-FLUTTER-QUIZ/lib/model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen(
      {super.key, required this.question, required this.onTab});

  final Question question;
  final void Function(int) onTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text(
            question.title,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              onTab(0); 
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              textStyle: const TextStyle(fontSize: 18),
              backgroundColor: Colors.blue[300],
            ),
            child: Text(question.possibleAnswers[0],
                style: const TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              onTab(1); 
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50), 
              textStyle: const TextStyle(fontSize: 18),
              backgroundColor: Colors.blue[300],
            ),
            child: Text(question.possibleAnswers[1],
                style: const TextStyle(color: Colors.white)),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              onTab(2); 
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              textStyle: const TextStyle(fontSize: 18),
              backgroundColor: Colors.blue[300],
            ),
            child: Text(question.possibleAnswers[2],
                style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
