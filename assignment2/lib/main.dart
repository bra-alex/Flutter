import 'package:flutter/material.dart';
import 'package:assignment2/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class Background extends StatelessWidget {
  const Background({super.key, required this.child});

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

class TextInputs extends StatefulWidget {
  const TextInputs({super.key, required this.placeholder});

  final String placeholder;
  @override
  State<TextInputs> createState() => _TextInputsState();
}

class _TextInputsState extends State<TextInputs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: Colors.transparent,
          elevation: 1.0,
          shadowColor: Colors.black.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: TextFormField(
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            decoration: InputDecoration(
                fillColor: Colors.white.withOpacity(0.2),
                filled: true,
                label: Text(
                  widget.placeholder,
                  style: const TextStyle(color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)))),
          ),
        )
      ],
    );
  }
}

class Buttons extends StatefulWidget {
  const Buttons({super.key, required this.placeholder, this.navigation});

  final String placeholder;
  final VoidCallback? navigation;
  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.navigation,
      child: Material(
        color: Colors.transparent,
        elevation: 5.0,
        shadowColor: Colors.black.withOpacity(1),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(widget.placeholder,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold))),
        ),
      ),
    );
  }
}
