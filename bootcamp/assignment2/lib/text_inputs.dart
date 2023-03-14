import 'package:flutter/material.dart';

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
