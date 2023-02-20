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
    newRecipe();
  }

  void newRecipe() async {
    recipe = fetchRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        isLoading
            ? const Center(child: CircularProgressIndicator())
            : FutureBuilder<Recipe>(
                future: recipe,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Stack(
                      children: [
                        Image(
                          image: NetworkImage(snapshot.data!.image),
                          fit: BoxFit.fitHeight,
                        ),
                        Positioned.fill(
                            child: ColoredBox(
                          color: Colors.black.withOpacity(0.3),
                        )),
                        Reload(fxn: () async {
                          setState(() {
                            isLoading = true;
                          });
                          newRecipe();
                          Future.delayed(const Duration(seconds: 2), () {
                            setState(() {
                              isLoading = false;
                            });
                          });
                        }),
                        SizedBox.expand(
                          child: DraggableScrollableSheet(
                              initialChildSize: 0.7,
                              minChildSize: 0.6,
                              builder: (context, scrollController) {
                                return Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            242, 242, 247, 1),
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                  (BuildContext context,
                                                      int index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, right: 15),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Header(
                                                        name:
                                                            snapshot.data!.name,
                                                        time: snapshot
                                                            .data!.timeTaken,
                                                        servings: snapshot
                                                            .data!.servings,
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      const Divider(),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Ingredients(
                                                          ingredient: snapshot
                                                              .data!
                                                              .ingredients),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      const Divider(),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      CookingInstructions(
                                                          instructions: snapshot
                                                              .data!
                                                              .instructions)
                                                    ],
                                                  ),
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
                  } else if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  }
                  return const Center(child: CircularProgressIndicator());
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
