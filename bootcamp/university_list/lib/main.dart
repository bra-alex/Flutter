import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:university_list/models/universities_model.dart';
import 'package:url_launcher/link.dart';

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
        appBar: AppBar(
          title: const Text('American Universities'),
          centerTitle: true,
        ),
        body: FutureBuilder<Universities>(
          future: fetchUniversities(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasData) {
              final universities = snapshot.data!.universities;
              return ListView.builder(
                itemCount: universities.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(universities[index].name),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DetailView(university: universities[index]);
                        },
                      );
                    },
                  );
                },
              );
            } else {
              return Center(
                  child: snapshot.hasError
                      ? Text('${snapshot.error}')
                      : const Text('Error'));
            }
          },
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.university});

  final University university;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        // color: Colors.white,
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
                constraints: const BoxConstraints(minHeight: 30, maxHeight: 50),
                width: double.maxFinite,
                color: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      university.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Domains',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: university.domains.length,
                    itemBuilder: (context, index) {
                      return Text(university.domains[index]);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Divider(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Web Pages',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: university.webPages.length,
                    itemBuilder: (context, index) {
                      return Link(
                        uri: Uri.parse(university.webPages[index]),
                        target: LinkTarget.self,
                        builder: (context, followLink) {
                          return RichText(
                              text: TextSpan(
                                  text: university.webPages[index],
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = followLink));
                        },
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Divider(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Country',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(university.country),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Divider(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Alpha Two Code',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(university.alphaTwoCode),
                  if (university.stateProvince != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Divider(),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'State Province',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(university.stateProvince!)
                      ],
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Divider extends StatelessWidget {
  const Divider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.black12),
    );
  }
}
