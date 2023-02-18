import 'package:flutter/material.dart';
import 'package:assignment2/main.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Background(
        child: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
