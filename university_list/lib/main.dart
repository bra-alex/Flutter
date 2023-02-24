import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:university_list/models/universities_model.dart';

void main() {
  runApp(const UniversityApp());
}

class UniversityApp extends StatelessWidget {
  const UniversityApp({super.key});

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
  Future<Universities> fetchUniversities() async {
    final response = await http.get(Uri.parse(
        'http://universities.hipolabs.com/search?country=United+States'));

    if (response.statusCode == 200) {
      return Universities.fromJSON(jsonDecode(response.body));
    }

    throw Exception('Could not get universities');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Universities>(
      future: fetchUniversities(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return snapshot.hasData
            ? Center(child: Text(snapshot.data!.universities.first.name))
            : const Center(child: Text('Error'));
      },
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
