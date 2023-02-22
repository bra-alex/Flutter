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
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
