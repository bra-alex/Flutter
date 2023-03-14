import 'package:basics/answer.dart';
import 'package:basics/question.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  const Quiz(
      {super.key,
      required this.question,
      required this.answers,
      required this.answerQuestion});

  final String question;
  final List<Map<String, Object>> answers;
  final Function answerQuestion;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question: question),
        ...answers.map(
          (answer) => AnswerButton(answer['text'] as String,
              answerQuestion: () => answerQuestion(answer['score'] as int)),
        ),
      ],
    );
  }
}
