import 'package:flutter/material.dart';

class Backround extends StatelessWidget {
  const Backround({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 195, 162, 249),
            Color.fromARGB(255, 147, 172, 249),
          ])),
      child: child,
    );
  }
}
