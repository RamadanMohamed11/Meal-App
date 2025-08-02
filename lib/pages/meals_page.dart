import 'package:flutter/material.dart';
import 'package:meal_app/models/meals_model.dart';
import 'package:meal_app/widgets/meal_list_view_widget.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({super.key, required this.categoryName, required this.meals});
  final String categoryName;
  final List<MealsModel> meals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(categoryName)),
      body:
          meals.isEmpty
              ? Center(
                child: Text(
                  'No meals found',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
              : MealListViewWidget(meals: meals),
    );
  }
}
