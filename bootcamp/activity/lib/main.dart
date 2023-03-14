import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:activity/model/activity_model.dart';

void main() {
  runApp(const ActivityGenerator());
}

class ActivityGenerator extends StatelessWidget {
  const ActivityGenerator({super.key});

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
  Future<Activity> fetchActivity() async {
    final response =
        await http.get(Uri.parse('https://www.boredapi.com/api/activity'));

    if (response.statusCode == 200) {
      return Activity.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception("Could't fetch activity");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text('Activity Generator'),
        actions: [
          IconButton(
              onPressed: () => setState(() {
                    fetchActivity();
                  }),
              icon: const Icon(Icons.refresh))
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
                future: fetchActivity(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return snapshot.hasData
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot.data!.type.toUpperCase(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  )
                                ]),
                            const SizedBox(
                              height: 50,
                            ),
                            Center(
                              child: SizedBox(
                                  width: 250,
                                  child: Text(
                                    snapshot.data!.activity,
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BottomRow(
                                    text:
                                        snapshot.data!.participants.toString(),
                                    icon: Icons.people),
                                const SizedBox(width: 30),
                                BottomRow(
                                    text: snapshot.data!.price.toString(),
                                    icon: Icons.attach_money)
                              ],
                            )
                          ],
                        )
                      : const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Could not load activity'),
                          ],
                        );
                }),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class BottomRow extends StatelessWidget {
  const BottomRow({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            icon,
            color: Colors.grey,
            size: 15,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
