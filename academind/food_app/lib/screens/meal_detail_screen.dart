import 'package:flutter/material.dart';
import 'package:food_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const route = '/meal-detail-screen';
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('meal.title'),
      ),
      body: const Center(
        child: Text('meal.imageUrl'),
      ),
    );
  }
}
