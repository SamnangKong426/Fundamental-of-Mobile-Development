import 'package:flutter_workspace/W7-S2-FLUTTER-QUIZ/lib/model/quiz.dart';

class Answer {
  final String questionAnswer;
  final Question question;

  Answer({required this.questionAnswer, required this.question});

  bool isCorrect() {
    // Return true if the answer is correct
    return questionAnswer == question.goodAnswer;
  }
}

class Submission {
  final List<Answer> answers;

  Submission({required this.answers});

  int getScorce() {
    int totalScore = 0;
    for (int i = 0; i < answers.length; i++) {
      if (answers[i].isCorrect()) totalScore++;
    }
    return totalScore;
  }

  Answer? getAnswerFor(Question question) {
    return answers
        .firstWhere((answer) => answer.questionAnswer == question.goodAnswer);
  }

  void addAnswer(Question question, String answer) {
    Answer newAnswer = Answer(questionAnswer: answer, question: question);
    answers.add(newAnswer);
  }

  void removeAnswer() {
    // Remove all answers
    answers.clear();
  }
}
