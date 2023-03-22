import 'package:flutter/material.dart';
import 'package:food_app/data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];

    final categoryMeals = dummyMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categoryMeals[index].title),
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
