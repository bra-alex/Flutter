import 'package:assignment2/home.dart';
import 'package:flutter/material.dart';
import 'package:assignment2/login.dart';
import 'package:assignment2/buttons.dart';
import 'package:assignment2/background.dart';
import 'package:assignment2/text_inputs.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Background(
        child: SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
                child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'Sign Up',
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
                const TextInputs(placeholder: 'First Name'),
                const SizedBox(
                  height: 40,
                ),
                Buttons(
                    placeholder: "Login",
                    navigation: () => Navigator.of(context).pop(
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()))),
                const SizedBox(
                  height: 40,
                ),
                Buttons(
                    placeholder: "Sign Up",
                    navigation: () => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const Home()),
                        (route) => false))
              ],
            )),
          )),
    ));
  }
}
