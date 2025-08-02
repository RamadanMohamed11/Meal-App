import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:meal_app/helper/extension.dart';
import 'package:meal_app/helper/tansitions.dart';
import 'package:meal_app/models/meals_model.dart';
import 'package:meal_app/pages/meal_detail_page.dart';
import 'package:meal_app/widgets/meal_item_widget.dart';

class MealListViewWidget extends StatelessWidget {
  const MealListViewWidget({super.key, required this.meals});

  final List<MealsModel> meals;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final meal = meals[index];
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.fastLinearToSlowEaseIn,
              verticalOffset: 300,
              horizontalOffset: 30,
              child: FlipAnimation(
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                flipAxis: FlipAxis.y,
                child: Column(
                  children: [
                    InkWell(
                      splashColor: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => MealDetailPage(meal: meal),
                        //   ),
                        // );

                        context.push(
                          CustomScaleTransition(
                            MealDetailPage(meal: meal),
                            alignment: Alignment.center,
                          ),
                        );
                      },

                      child: MealItemWidget(meal: meal),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white.withOpacity(0.9),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.schedule, color: Colors.black),
                              SizedBox(width: 6),
                              Text(
                                '${meal.duration} min',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 20),
                              Icon(Icons.work, color: Colors.black),
                              SizedBox(width: 6),
                              Text(
                                meal.complexity.name.toUpperCase(),
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(width: 20),
                              Icon(Icons.attach_money, color: Colors.black),
                              SizedBox(width: 6),
                              Text(
                                meal.affordability.name.toUpperCase(),
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    (meals.length > 1 && index < meals.length - 1)
                        ? Divider(color: Colors.grey, thickness: 2)
                        : SizedBox(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
