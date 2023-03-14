import 'package:flutter/material.dart';
import 'package:jokes_app/fetch_joke.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:jokes_app/models/joke_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Jokes> joke;
  bool isLoading = false;
  bool showPunchline = false;

  @override
  void initState() {
    super.initState();
    getJoke();
  }

  void getJoke() async {
    joke = fetchJoke();
    Future.delayed(const Duration(seconds: 2), () {
      punchline();
    });
  }

  void punchline() async {
    setState(() {
      showPunchline = false;
    });

    final player = AudioPlayer();
    await player.play(AssetSource('sounds/drums_roll.mp3'));

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showPunchline = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 80),
              const Text(
                'Jokes Generator',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : FutureBuilder<Jokes>(
                        future: joke,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                                height: 250,
                                width: 400,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.blue[50]),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        snapshot.data!.setup,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                      const SizedBox(height: 30),
                                      showPunchline
                                          ? Text(
                                              snapshot.data!.punchline,
                                              style:
                                                  const TextStyle(fontSize: 15),
                                            )
                                          : const Text('')
                                    ],
                                  ),
                                ));
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }

                          return const CircularProgressIndicator();
                        }),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  getJoke();
                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      isLoading = false;
                    });
                  });
                },
                child: Material(
                  color: Colors.transparent,
                  elevation: 5.0,
                  shadowColor: Colors.black.withOpacity(1),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text("New Joke",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
