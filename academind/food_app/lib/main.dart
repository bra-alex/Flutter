import 'package:flutter/material.dart';
import 'package:food_app/screens/categories_screen.dart';
import 'package:food_app/screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        colorScheme: ThemeData(useMaterial3: true).colorScheme.copyWith(
              primary: Colors.pink,
              secondary: Colors.amber,
            ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyMedium: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          titleSmall: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const CategoriesScreen(),
      routes: {
        '/category-meals': (context) => const CategoryMealsScreen(),
      },
    );
  }
}
