import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mentorship/models/crypto_model.dart';
import 'package:mentorship/models/nationalize_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<CryptoModel> _getCrypto() async {
    final response = await get(
        Uri.parse("https://api.coindesk.com/v1/bpi/currentprice.json"));

    return CryptoModel.fromJSON(jsonDecode(response.body));
  }

  Future<NationalizeModel> _getNationalize() async {
    final response =
        await get(Uri.parse("https://api.nationalize.io/?name=nathaniel"));

    return NationalizeModel.fromJSON(jsonDecode(response.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: _getNationalize(),
          builder: (context, snapshot) {
            print(snapshot.error);
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Nationalize(nationalize: snapshot.data!);
              case ConnectionState.waiting:
                return const CircularProgressIndicator();

              default:
                return const Text('Failed');
            }
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Nationalize extends StatelessWidget {
  const Nationalize({super.key, required this.nationalize});

  final NationalizeModel nationalize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(nationalize.name),
              Expanded(
                child: ListView.builder(
                  itemCount: nationalize.country.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          "Country: ${nationalize.country[index].countryId}"),
                      subtitle: Text(
                          "Probability: ${nationalize.country[index].probability}"),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Crypto extends StatelessWidget {
  const Crypto({super.key, required this.crypto});
  final CryptoModel crypto;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(crypto.chartName),
            Text(crypto.disclaimer),
            Text(crypto.time.updatedISO),
          ],
        ),
      ),
    );
  }
}
