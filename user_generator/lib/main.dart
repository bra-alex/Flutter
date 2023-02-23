import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:user_generator/models/user_model.dart';

void main() {
  runApp(const UserGenerator());
}

class UserGenerator extends StatelessWidget {
  const UserGenerator({super.key});

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
  Future<Results> fetchUser() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/'));
    if (response.statusCode == 200) {
      return Results.fromJSON(jsonDecode(response.body));
    } else {
      throw Exception('No user found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random User Generator'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  fetchUser();
                });
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<Results>(
                future: fetchUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasData) {
                    final user = snapshot.data!.results.first;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                            child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(128),
                                  child: Image.network(user.picture.large)),
                            ),
                            Text('Joined ${user.registered.formattedDate()}')
                          ],
                        )),
                        const SizedBox(height: 30),
                        Center(
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(25),
                            child: Container(
                              width: 350,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8, left: 15, right: 15, bottom: 8),
                                child: Column(
                                  children: [
                                    InfoRows(
                                      title: 'Name',
                                      data: user.name.fullName(),
                                    ),
                                    const Divider(),
                                    InfoRows(title: 'Gender', data: user.sex()),
                                    const Divider(),
                                    InfoRows(title: 'Email', data: user.email),
                                    const Divider(),
                                    InfoRows(
                                        title: 'Date Of Birth',
                                        data: user.dob.formattedDate()),
                                    const Divider(),
                                    InfoRows(
                                        title: 'Street',
                                        data:
                                            user.location.street.fullStreet()),
                                    const Divider(),
                                    InfoRows(
                                        title: 'City',
                                        data:
                                            '${user.location.city}, ${user.location.state}'),
                                    const Divider(),
                                    InfoRows(
                                        title: 'Country',
                                        data: user.location.country),
                                    const Divider(),
                                    InfoRows(
                                        title: 'Postcode',
                                        data: user.location.postcode)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  } else {
                    return const Center(child: Text('Could not fecth user'));
                  }
                })
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class InfoRows extends StatelessWidget {
  const InfoRows({super.key, required this.title, required this.data});

  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Text(data)
        ],
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
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.black12),
    );
  }
}
