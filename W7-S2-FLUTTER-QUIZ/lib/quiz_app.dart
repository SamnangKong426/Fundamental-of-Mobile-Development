import 'package:flutter/material.dart';
import 'package:flutter_workspace/W7-S2-FLUTTER-QUIZ/lib/model/submission.dart';
import 'package:flutter_workspace/W7-S2-FLUTTER-QUIZ/lib/screens/question_screen.dart';
import 'package:flutter_workspace/W7-S2-FLUTTER-QUIZ/lib/screens/result_screen.dart';
import 'package:flutter_workspace/W7-S2-FLUTTER-QUIZ/lib/screens/welcome_screen.dart';
import 'model/quiz.dart';

Color appColor = Colors.blue[500] as Color;

enum QuizeState { NOT_STARTED, STARTED, FINISHED }

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _questionIndex = 0;
  QuizeState _quizState = QuizeState.NOT_STARTED;
  List<Answer> _answers = [];

  void changeScreenCallBack() {
    setState(() {
      if (_quizState == QuizeState.NOT_STARTED) {
        _quizState = QuizeState.STARTED;
      } else if (_quizState == QuizeState.STARTED) {
        _quizState = QuizeState.FINISHED;
      } else {
        _quizState = QuizeState.NOT_STARTED;
        _questionIndex = 0;
        _answers = [];
      }
    });
  }

  void changeQuestionScreenCallBack(int answerIndex) {
    setState(() {
      print('Button $answerIndex tapped');
      _answers.add(Answer(
        questionAnswer:
            widget.quiz.questions[_questionIndex].possibleAnswers[answerIndex],
        question: widget.quiz.questions[_questionIndex],
      ));
      _questionIndex++;
      if (_questionIndex == widget.quiz.questions.length) {
        _quizState = QuizeState.FINISHED;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(child: _buildWidgetBasedOnQuizeState(_quizState)),
      ),
    );
  }

  Widget _buildWidgetBasedOnQuizeState(QuizeState quizeState) {
    switch (quizeState) {
      case QuizeState.NOT_STARTED:
        return WelcomeScreen(
            onStart: changeScreenCallBack, quizTitle: widget.quiz.title);
      case QuizeState.STARTED:
        return QuestionScreen(
            question: widget.quiz.questions[_questionIndex],
            onTab: changeQuestionScreenCallBack);
      case QuizeState.FINISHED:
        return ResultScreen(
          onRestart: changeScreenCallBack,
          submission: Submission(answers: _answers),
          quiz: widget.quiz,
        );
    }
  }
}
