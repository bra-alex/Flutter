import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Assignment(),
    );
  }
}

class Assignment extends StatelessWidget {
  const Assignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [Header(), LoremIpsum(), LoremIpsum()])),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          'Login',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 50, color: Colors.white),
        )
      ],
    );
  }
}

class LoremIpsum extends StatelessWidget {
  const LoremIpsum({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
          textAlign: TextAlign.justify,
          text: const TextSpan(
              text:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pulvinar malesuada consequat. Nunc id viverra massa, eget suscipit elit. Maecenas porttitor risus feugiat augue dapibus posuere. Nam non mollis est. Fusce vitae nisi eget purus tempus dignissim ac et augue. Aenean fringilla elit in commodo malesuada. Donec mauris leo, interdum eget dignissim eu, auctor interdum erat. Suspendisse eu diam imperdiet, vehicula ante ultricies, ultricies turpis. Mauris volutpat dui eu dignissim elementum. Aenean imperdiet pellentesque lectus, sollicitudin ullamcorper enim pulvinar nec.',
              style: TextStyle(color: Colors.white, fontSize: 14))),
    );
  }
}
