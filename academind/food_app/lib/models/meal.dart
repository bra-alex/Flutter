enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  final String id;
  final String title;
  final int duration;
  final String imageUrl;

  final Complexity complexity;
  final Affordability affordability;

  final bool isVegan;
  final bool isVegetarian;
  final bool isGlutenFree;
  final bool isLactoseFree;

  final List<String> steps;
  final List<String> categories;
  final List<String> ingredients;

  const Meal({
    required this.id,
    required this.title,
    required this.duration,
    required this.imageUrl,
    required this.complexity,
    required this.affordability,
    required this.isVegan,
    required this.isVegetarian,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.steps,
    required this.categories,
    required this.ingredients,
  });
}
