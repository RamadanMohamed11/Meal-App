import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meal_app/constants.dart';
import 'package:meal_app/cubits/filter_cubit/filter_cubit_states.dart';

class FilterCubit extends Cubit<FilterCubitStates> {
  late bool isGlutenFree;
  late bool isLactoseFree;
  late bool isVegan;
  late bool isVegetarian;
  late bool isAllMeals;
  FilterCubit() : super(InitialFilterState()) {
    _loadFilters();
  }

  Future<void> _loadFilters() async {
    try {
      final Box<bool> filterBox = Hive.box<bool>(kFilterBoxName);
      isGlutenFree =
          filterBox.get("isGlutenFree", defaultValue: false) ?? false;
      isLactoseFree =
          filterBox.get("isLactoseFree", defaultValue: false) ?? false;
      isVegan = filterBox.get("isVegan", defaultValue: false) ?? false;
      isVegetarian =
          filterBox.get("isVegetarian", defaultValue: false) ?? false;
      isAllMeals = filterBox.get("isAllMeals", defaultValue: false) ?? false;
    } catch (e) {
      log('Error loading filters: ${e.toString()}');
    }
  }

  void filterSet({required String title, required bool value}) {
    try {
      Box<bool> filterBox = Hive.box<bool>(kFilterBoxName);
      if (isAllMeals) {
        isAllMeals = false;
        filterBox.put("isAllMeals", isAllMeals);
      }
      switch (title) {
        case "Gluten-Free":
          isGlutenFree = value;
          filterBox.put("isGlutenFree", isGlutenFree);
          emit(GlutenSetState(isGlutenFree));
          break;
        case "Lactose-Free":
          isLactoseFree = value;
          filterBox.put("isLactoseFree", isLactoseFree);
          emit(LactoseSetState(isLactoseFree));
          break;
        case "Vegan":
          isVegan = value;
          filterBox.put("isVegan", isVegan);
          emit(VeganSetState(isVegan));
          break;
        case "Vegetarian":
          isVegetarian = value;
          filterBox.put("isVegetarian", isVegetarian);
          emit(VegetarianSetState(isVegetarian));
          break;
        case "All Meals":
          isGlutenFree = value;
          filterBox.put("isGlutenFree", isGlutenFree);

          isLactoseFree = value;
          filterBox.put("isLactoseFree", isLactoseFree);

          isVegan = value;
          filterBox.put("isVegan", isVegan);

          isVegetarian = value;
          filterBox.put("isVegetarian", isVegetarian);

          isAllMeals = value;
          filterBox.put("isAllMeals", isAllMeals);
          emit(AllMealsSetState(isAllMeals));
          break;
      }
      if (isGlutenFree && isLactoseFree && isVegan && isVegetarian) {
        isAllMeals = value;
        filterBox.put("isAllMeals", isAllMeals);
        emit(AllMealsSetState(isAllMeals));
      }

      log("isGlutenFree: $isGlutenFree");
      log("isLactoseFree: $isLactoseFree");
      log("isVegetarian: $isVegetarian");
      log("isVegan: $isVegan");
      log("isAllMeals: $isAllMeals");
    } catch (e) {
      // Handle any errors that may occur during setting filters
      log('Error setting filter: ${e.toString()}');
    }
  }

  bool getSwitchState(String title) {
    switch (title) {
      case "Gluten-Free":
        return isGlutenFree;
      case "Lactose-Free":
        return isLactoseFree;
      case "Vegan":
        return isVegan;
      case "Vegetarian":
        return isVegetarian;
      case "All Meals":
        return isAllMeals;
      default:
        return false;
    }
  }
}
