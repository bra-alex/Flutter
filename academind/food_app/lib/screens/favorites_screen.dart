import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen(this.favoriteMeals, {super.key});
  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? const Center(
            child: Text('You have no favorites yet!'),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: MealItem(
                  meal: favoriteMeals[index],
                ),
              );
            },
            itemCount: favoriteMeals.length,
          );
  }
}
