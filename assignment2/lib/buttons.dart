import 'package:flutter/material.dart';

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
