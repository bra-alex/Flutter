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
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FutureBuilder<Recipe>(
            future: fetchRecipe(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return Stack(
                children: [
                  snapshot.hasData
                      ? Image(
                          image: NetworkImage(snapshot.data!.image),
                          fit: BoxFit.fitHeight,
                        )
                      : const Text(''),
                  Positioned.fill(
                      child: ColoredBox(
                    color: Colors.black.withOpacity(0.3),
                  )),
                  Reload(fxn: () {
                    setState(() {
                      fetchRecipe();
                    });
                  }),
                  SizedBox.expand(
                    child: DraggableScrollableSheet(
                        initialChildSize: 0.7,
                        minChildSize: 0.6,
                        builder: (context, scrollController) {
                          return Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(242, 242, 247, 1),
                                  borderRadius: BorderRadius.circular(40)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 15, bottom: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 5,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.black45),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: 1,
                                        controller: scrollController,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 15),
                                            child: snapshot.hasData
                                                ? RecipeData(
                                                    recipe: snapshot.data!)
                                                : const Center(
                                                    child: Text(
                                                    'Could not load recipe',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  )),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        }),
                  )
                ],
              );
            }),
      ]),
    );
  }
}

class Reload extends StatelessWidget {
  const Reload({super.key, required this.fxn});

  final VoidCallback fxn;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            child: IconButton(
              onPressed: fxn,
              icon: const Icon(
                Icons.refresh,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    ));
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

class RecipeData extends StatelessWidget {
  const RecipeData({super.key, required this.recipe});
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Header(
          name: recipe.name,
          time: recipe.timeTaken,
          servings: recipe.servings,
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        Ingredients(ingredient: recipe.ingredients),
        const SizedBox(
          height: 20,
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        CookingInstructions(instructions: recipe.instructions)
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header(
      {super.key,
      required this.name,
      required this.time,
      required this.servings});

  final String name;
  final String time;
  final String servings;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.access_time),
            ),
            Text(time),
            const SizedBox(
              width: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset(
                'assets/images/servings.png',
                width: 24,
                height: 24,
              ),
            ),
            Text(servings)
          ],
        )
      ],
    );
  }
}

class Ingredients extends StatelessWidget {
  const Ingredients({super.key, required this.ingredient});

  final String ingredient;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/ingredients.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
              const Text(
                'Ingredients',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Text(
          ingredient,
          style: const TextStyle(height: 2.0),
        )
      ],
    );
  }
}

class CookingInstructions extends StatelessWidget {
  const CookingInstructions({super.key, required this.instructions});

  final String instructions;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/cook.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
              const Text(
                'Instructions',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Text(
          instructions,
          style: const TextStyle(height: 2.0),
        )
      ],
    );
  }
}
