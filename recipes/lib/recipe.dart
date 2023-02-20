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
      body: Stack(children: [
        FutureBuilder<Recipe>(
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
                    SizedBox.expand(
                      child: DraggableScrollableSheet(
                          initialChildSize: 0.7,
                          minChildSize: 0.6,
                          maxChildSize: 0.8,
                          builder: (context, scrollController) {
                            return Container(
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(242, 242, 247, 1),
                                    borderRadius: BorderRadius.circular(40)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 15),
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
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, right: 15),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Header(
                                                    name: snapshot.data!.name,
                                                    time: snapshot
                                                        .data!.timeTaken,
                                                    servings:
                                                        snapshot.data!.servings,
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  const Divider()
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
                return Text('${snapshot.error}');
              }
              return const Center(child: CircularProgressIndicator());
            }),
        SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        )),
      ]),
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
