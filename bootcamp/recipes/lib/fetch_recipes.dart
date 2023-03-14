import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipes/models/recipes_model.dart';

Future<Recipe> fetchRecipe() async {
  final response = await http
      .get(Uri.parse('https://recipes-api-o5ux.onrender.com/recipes/random'));

  if (response.statusCode == 200) {
    return Recipe.fromJSON(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load recipe');
  }
}
