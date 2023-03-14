class Recipe {
  int id;
  String name;
  String image;
  String servings;
  String ingredients;
  String timeTaken;
  String instructions;

  Recipe({
    required this.id,
    required this.name,
    required this.image,
    required this.servings,
    required this.ingredients,
    required this.timeTaken,
    required this.instructions,
  });

  factory Recipe.fromJSON(Map<String, dynamic> json) {
    return Recipe(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        servings: json['servings'],
        ingredients: json['ingredients'],
        timeTaken: json['timeTaken'],
        instructions: json['instructions']);
  }
}
