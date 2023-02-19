import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jokes_app/models/joke_model.dart';

Future<Jokes> fetchJoke() async {
  final response = await http
      .get(Uri.parse('https://official-joke-api.appspot.com/random_joke'));
  if (response.statusCode == 200) {
    return Jokes.fromJSON(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load joke');
  }
}
