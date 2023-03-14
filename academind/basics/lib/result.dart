import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key, required this.score, required this.reset});

  final int score;
  final VoidCallback reset;

  String get resultPhrase {
    String txt;

    if (score <= 8) {
      txt = 'You are awesome and innocent!';
    } else if (score <= 12) {
      txt = 'Pretty likeable!';
    } else if (score <= 16) {
      txt = 'You are ... strange?!';
    } else {
      txt = 'You are so bad!';
    }
    return txt;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: reset,
            child: const Text('Reset'),
          )
        ],
      ),
    );
  }
}
