import 'package:flutter/material.dart';
import 'package:assignment2/main.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'App under construction...',
              style: TextStyle(color: Colors.white, fontSize: 40),
            )
          ],
        ),
      ),
    ));
  }
}
