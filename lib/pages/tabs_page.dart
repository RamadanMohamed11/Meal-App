import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/cubits/tab_select_cubit/tab_select_cubit.dart';
import 'package:meal_app/cubits/tab_select_cubit/tab_select_cubit_states.dart';
import 'package:meal_app/pages/category_page.dart';
import 'package:meal_app/pages/fav_meals_page.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabSelectCubit, TabSelectCubitStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state is TabSelectCubitCategoryState
                  ? 'Meal Categories'
                  : 'Favorite Meals',
            ),
            centerTitle: true,
          ),
          drawer: MainDrawer(),
          body:
              state is TabSelectCubitCategoryState
                  ? CategoryPage()
                  : FavMealsPage(),
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 25,
            selectedFontSize: 18,
            unselectedFontSize: 14,
            currentIndex: BlocProvider.of<TabSelectCubit>(context).index,
            onTap:
                (index) =>
                    BlocProvider.of<TabSelectCubit>(context).selectTab(index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  BlocProvider.of<TabSelectCubit>(context).index == 0
                      ? Icons.favorite_border
                      : Icons.favorite,
                  color: Colors.red,
                ),
                label: 'Favorites',
              ),
            ],
          ),
        );
      },
    );
  }
}
