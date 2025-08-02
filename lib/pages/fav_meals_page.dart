import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/constants.dart';
import 'package:meal_app/cubits/fav_cubit/fav_cubit.dart';
import 'package:meal_app/cubits/fav_cubit/fav_cubit_states.dart';
import 'package:meal_app/widgets/meal_list_view_widget.dart';

class FavMealsPage extends StatelessWidget {
  const FavMealsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavCubitStates>(
      builder: (context, state) {
        return Scaffold(
          body:
              BlocProvider.of<FavCubit>(context).favoriteMealsList.isEmpty
                  ? Center(
                    child: Text(
                      'No favorite meals added yet!',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                  : MealListViewWidget(
                    meals:
                        dummyMeals.where((meal) {
                          return BlocProvider.of<FavCubit>(
                            context,
                          ).favoriteMealsList.contains(meal.id);
                        }).toList(),
                  ),
        );
      },
    );
  }
}
