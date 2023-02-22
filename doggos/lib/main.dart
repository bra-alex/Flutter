import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'package:doggos/models/doggo_model.dart';

void main() {
  runApp(const DoggoGenerator());
}

class DoggoGenerator extends StatelessWidget {
  const DoggoGenerator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<DoggoModel> fetchDoggo() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

    if (response.statusCode == 200) {
      return DoggoModel.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception('Could not get doggo info');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDoggo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Doggo Generator',
              style: TextStyle(fontSize: 25),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        fetchDoggo();
                      });
                    },
                    icon: const Icon(Icons.refresh)),
              )
            ],
          ),
          body: Stack(
            children: [
              Center(
                child: Material(
                    elevation: 5.0,
                    child: Container(
                      height: 300,
                      width: 300,
                      color: Colors.white,
                    )),
              ),
              Center(
                child: FutureBuilder(
                    future: fetchDoggo(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData) {
                        final player = AudioPlayer();
                        player.play(AssetSource('sounds/bark.mp3'));
                        return Image.network(
                          snapshot.data!.message,
                          width: 275,
                          height: 275,
                        );
                      } else {
                        return const Text('Could not load dog image');
                      }
                    }),
              ),
            ],
          )),
    );
  }
}
