abstract class FavCubitStates {}

class InitialFavState extends FavCubitStates {}

class AddMealToFavState extends FavCubitStates {
  final String mealId;

  AddMealToFavState(this.mealId);
}

class RemoveMealFromFavState extends FavCubitStates {
  final String mealId;

  RemoveMealFromFavState(this.mealId);
}
