import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/cubits/fav_cubit/fav_cubit.dart';
import 'package:meal_app/cubits/fav_cubit/fav_cubit_states.dart';
import 'package:meal_app/models/meals_model.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({super.key, required this.meal});

  final MealsModel meal;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavCubitStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(meal.title),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  BlocProvider.of<FavCubit>(context).isMealFavorite(meal.id)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color:
                      BlocProvider.of<FavCubit>(context).isMealFavorite(meal.id)
                          ? Colors.red
                          : Colors.white,
                ),
                onPressed: () async {
                  if (BlocProvider.of<FavCubit>(
                    context,
                  ).isMealFavorite(meal.id)) {
                    await BlocProvider.of<FavCubit>(
                      context,
                    ).removeMealFromFav(meal.id);
                    log('Meal removed from favorites');
                  } else {
                    await BlocProvider.of<FavCubit>(
                      context,
                    ).addMealToFav(meal.id);
                    log('Meal added to favorites');
                  }
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  "Ingredients",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                for (String ingredient in meal.ingredients)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Text(
                      ingredient,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                SizedBox(height: 25),
                Text(
                  "Steps",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                for (String step in meal.steps)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Text(
                      step,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
