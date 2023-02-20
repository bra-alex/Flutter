import 'package:flutter/material.dart';
import 'package:recipes/fetch_recipes.dart';
import 'package:recipes/models/recipes_model.dart';

class RecipeView extends StatefulWidget {
  const RecipeView({super.key});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  late Future<Recipe> recipe;

  @override
  void initState() {
    super.initState();
    recipe = fetchRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.refresh),
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white),
                elevation: MaterialStatePropertyAll(10.0)),
          )
        ],
        elevation: 0,
      ),
      body: SafeArea(
          child: FutureBuilder<Recipe>(
              future: recipe,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Stack(
                    children: [
                      Image(image: NetworkImage(snapshot.data!.image))
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              })),
    );
  }
}
