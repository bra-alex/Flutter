import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';
import 'package:food_app/data/dummy_data.dart';
import 'package:food_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  const CategoryMealsScreen({super.key});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? categoryMeals;

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryId = routeArgs['id'];
    categoryTitle = routeArgs['title'].toString();
    categoryMeals = dummyMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: MealItem(
              meal: categoryMeals![index],
              removeMeal: _removeMeal,
            ),
          );
        },
        itemCount: categoryMeals!.length,
      ),
    );
  }
}
