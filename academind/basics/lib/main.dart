import 'package:basics/question.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dart Basics'),
        ),
        body: Column(
          children: [
            Question(question: questions[_questionIndex]),
            ElevatedButton(
              onPressed: _answerQuestion,
              child: const Text('Answer 1'),
            ),
            ElevatedButton(
              onPressed: _answerQuestion,
              child: const Text('Answer 2'),
            ),
            ElevatedButton(
              onPressed: _answerQuestion,
              child: const Text('Answer 3'),
            ),
          ],
        ),
      ),
    );
  }
}
