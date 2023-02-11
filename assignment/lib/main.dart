import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Assignment(),
  ));
}

class Assignment extends StatelessWidget {
  const Assignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Login',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.white),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
              textAlign: TextAlign.justify,
              text: const TextSpan(
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam pulvinar malesuada consequat. Nunc id viverra massa, eget suscipit elit. Maecenas porttitor risus feugiat augue dapibus posuere. Nam non mollis est. Fusce vitae nisi eget purus tempus dignissim ac et augue. Aenean fringilla elit in commodo malesuada. Donec mauris leo, interdum eget dignissim eu, auctor interdum erat. Suspendisse eu diam imperdiet, vehicula ante ultricies, ultricies turpis. Mauris volutpat dui eu dignissim elementum. Aenean imperdiet pellentesque lectus, sollicitudin ullamcorper enim pulvinar nec.',
                  style: TextStyle(color: Colors.white, fontSize: 14))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
              textAlign: TextAlign.justify,
              text: const TextSpan(
                  text:
                      'Nam id congue tortor, sit amet lacinia neque. Nullam luctus est nibh, eget finibus dui ultrices ut. Maecenas imperdiet risus in metus feugiat, vitae elementum massa aliquet. Integer consequat laoreet nisi, sed rhoncus eros faucibus convallis. Vivamus leo urna, rhoncus eget nisl vel, ultrices malesuada turpis. Nunc massa nunc, feugiat nec pharetra et, faucibus vitae elit. Sed risus lacus, malesuada vel fermentum ut, volutpat luctus lacus. Praesent iaculis quam sit amet imperdiet bibendum. Nam posuere consectetur augue, sit amet vehicula mauris congue finibus. Ut tempus blandit tellus sit amet efficitur. Aliquam vel dui vel orci consectetur finibus. Praesent varius volutpat mi, ac pharetra orci hendrerit nec. Nullam elementum tellus at nulla molestie, a semper orci pretium. Aenean tristique, dolor eget facilisis mattis, diam nisl iaculis ex, eu laoreet lacus sem in orci. Morbi sodales, libero ac congue rutrum, sapien quam bibendum sem, quis vestibulum elit ipsum facilisis urna. Phasellus orci nisl, ullamcorper at consectetur nec, euismod id dui.',
                  style: TextStyle(color: Colors.white, fontSize: 14))),
        )
      ])),
    );
  }
}
