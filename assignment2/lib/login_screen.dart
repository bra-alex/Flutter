import 'package:assignment2/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:assignment2/buttons.dart';
import 'package:assignment2/background.dart';
import 'package:assignment2/text_inputs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Backround(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Login',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 40,
              ),
              const TextInputs(placeholder: 'Email Address'),
              const SizedBox(
                height: 40,
              ),
              const TextInputs(placeholder: 'Password'),
              const SizedBox(
                height: 40,
              ),
              Buttons(placeholder: "Login", navigation: () => {}),
              const SizedBox(
                height: 40,
              ),
              Buttons(
                  placeholder: "Sign Up",
                  navigation: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignupScreen()));
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
