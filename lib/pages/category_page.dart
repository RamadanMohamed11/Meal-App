import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:meal_app/constants.dart';
import 'package:meal_app/cubits/filter_cubit/filter_cubit.dart';
import 'package:meal_app/helper/extension.dart';
import 'package:meal_app/helper/tansitions.dart';
import 'package:meal_app/pages/meals_page.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [
          ...categories.map((category) {
            return AnimationConfiguration.staggeredGrid(
              position: categories.indexOf(category),
              duration: const Duration(milliseconds: 500),
              columnCount: 2,
              child: ScaleAnimation(
                duration: const Duration(milliseconds: 900),
                curve: Curves.fastLinearToSlowEaseIn,
                scale: 1.5,
                child: FadeInAnimation(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: InkWell(
                    splashColor: Colors.white.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      context.push(
                        CustomSizeTransition(
                          MealsPage(
                            categoryName: category.title,
                            meals:
                                dummyMeals.where((meal) {
                                  if (meal.categories.contains(category.id)) {
                                    if (BlocProvider.of<FilterCubit>(
                                          context,
                                        ).isAllMeals ==
                                        true) {
                                      return true;
                                    } else if (meal.isGlutenFree ==
                                            BlocProvider.of<FilterCubit>(
                                              context,
                                            ).isGlutenFree ||
                                        meal.isLactoseFree ==
                                            BlocProvider.of<FilterCubit>(
                                              context,
                                            ).isLactoseFree ||
                                        meal.isVegan ==
                                            BlocProvider.of<FilterCubit>(
                                              context,
                                            ).isVegan ||
                                        meal.isVegetarian ==
                                            BlocProvider.of<FilterCubit>(
                                              context,
                                            ).isVegetarian) {
                                      return meal.categories.contains(
                                        category.id,
                                      );
                                    }
                                  }
                                  return false;
                                }).toList(),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            category.color.withOpacity(0.6),

                            category.color.withOpacity(0.9),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          category.title,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
