import 'package:flutter/material.dart';
import 'package:assignment2/background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Backround(
        child: Scaffold(
      backgroundColor: Colors.transparent,
    ));
  }
}
