import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.text, {super.key, required this.answerQuestion});

  final String text;
  final VoidCallback answerQuestion;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: answerQuestion,
        child: Text(text),
      ),
    );
  }
}
