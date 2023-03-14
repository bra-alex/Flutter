import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({super.key, required this.question});

  final String question;

  @override
  Widget build(BuildContext context) {
    return Text(question);
  }
}
