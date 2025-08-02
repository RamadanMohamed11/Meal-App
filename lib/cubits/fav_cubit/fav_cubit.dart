import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meal_app/constants.dart';
import 'package:meal_app/cubits/fav_cubit/fav_cubit_states.dart';

class FavCubit extends Cubit<FavCubitStates> {
  FavCubit() : super(InitialFavState()) {
    loadFavoriteMeals();
  }

  late List<String> favoriteMealsList;

  Future<void> loadFavoriteMeals() async {
    Box<String> favoritesBox = Hive.box<String>(kFavBoxName);
    favoriteMealsList = favoritesBox.values.toList();
  }

  Future<void> addMealToFav(String mealId) async {
    if (favoriteMealsList.contains(mealId)) {
      return; // Meal is already in favorites, no need to add again
    }
    Box<String> favoritesBox = Hive.box<String>(kFavBoxName);
    await favoritesBox.put(mealId, mealId);
    favoriteMealsList.add(mealId);
    emit(AddMealToFavState(mealId));
  }

  Future<void> removeMealFromFav(String mealId) async {
    if (!favoriteMealsList.contains(mealId)) {
      return; // Meal is not in favorites, no need to remove
    }
    Box<String> favoritesBox = Hive.box<String>(kFavBoxName);
    await favoritesBox.delete(mealId);
    favoriteMealsList.remove(mealId);
    emit(RemoveMealFromFavState(mealId));
  }

  bool isMealFavorite(String mealId) {
    return favoriteMealsList.contains(mealId);
  }
}
