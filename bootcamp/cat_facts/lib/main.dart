import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:cat_facts/models/cat_facts_model.dart';

void main() {
  runApp(const CatFactsApp());
}

class CatFactsApp extends StatelessWidget {
  const CatFactsApp({super.key});

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
  Future<CatFacts> fetchFact() async {
    final response = await http.get(Uri.parse('https://catfact.ninja/fact'));

    if (response.statusCode == 200) {
      return CatFacts.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception('Could not fetch fact');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Cat Facts Generator',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 50,
        ),
        Stack(
          children: [
            Center(
                child: Material(
                    elevation: 5.0,
                    child: Container(
                      height: 300,
                      width: 300,
                      color: Colors.white,
                    ))),
            Center(
              child: FutureBuilder(
                  future: fetchFact(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return Container(
                      height: 300,
                      width: 300,
                      color: Colors.white,
                      child: Column(children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset(
                          snapshot.hasData
                              ? 'assets/images/cat.png'
                              : 'assets/images/sad.png',
                          height: snapshot.hasData ? 100 : 50,
                          width: snapshot.hasData ? 100 : 50,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: snapshot.hasData
                              ? SizedBox(
                                  width: 250,
                                  child: Text(
                                    snapshot.data!.fact,
                                  ),
                                )
                              : const Text('Could not fetch fact'),
                        )
                      ]),
                    );
                  }),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
            onPressed: () => setState(() {
                  fetchFact();
                }),
            child: Container(
                height: 40,
                width: 120,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Generate Fact',
                    style: TextStyle(color: Colors.white),
                  ),
                )))
      ]),
    );
  }
}
