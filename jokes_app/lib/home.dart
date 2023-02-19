import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                child: Container(
                  height: 250,
                  width: 4000,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blue[50]),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Why are fish easy to weigh?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Because they have their own scales.",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {},
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
