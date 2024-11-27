import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7-S2-FLUTTER-QUIZ/lib/model/quiz.dart';
import 'package:flutter_workspace/W7-S2-FLUTTER-QUIZ/lib/model/submission.dart';

class ResultScreen extends StatelessWidget {
  final Submission submission;
  final Quiz quiz;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.submission,
    required this.quiz,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final int correctAnswersCount =
        submission.answers.where((answer) => answer.isCorrect()).length;

    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswersCount of ${quiz.questions.length}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: submission.answers.length,
                itemBuilder: (context, index) {
                  final answer = submission.answers[index];
                  final isCorrect = answer.isCorrect();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isCorrect ? Colors.green : Colors.red,
                            ),
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            quiz.questions[index].title,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 10),
                      for (int i = 0;
                          i < answer.question.possibleAnswers.length;
                          i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            (answer.question.possibleAnswers[i] ==
                                    answer.question.goodAnswer)
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.black,
                                  )
                                : const SizedBox(width: 24),
                            Center(
                              child: Text(
                                answer.question.possibleAnswers[i],
                                style: TextStyle(
                                  fontSize: 16,
                                  color: answer.question.possibleAnswers[i] ==
                                          answer.questionAnswer
                                      ? isCorrect
                                          ? Colors.green
                                          : Colors.red
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: onRestart,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50), // Full width button
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: Colors.blue[300],
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh, color: Colors.white),
                    Text('Restart Quiz', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
