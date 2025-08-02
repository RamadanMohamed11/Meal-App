abstract class FilterCubitStates {}

class InitialFilterState extends FilterCubitStates {}

class GlutenSetState extends FilterCubitStates {
  final bool isGlutenFree;

  GlutenSetState(this.isGlutenFree);
}

class LactoseSetState extends FilterCubitStates {
  final bool isLactoseFree;

  LactoseSetState(this.isLactoseFree);
}

class VeganSetState extends FilterCubitStates {
  final bool isVegan;

  VeganSetState(this.isVegan);
}

class VegetarianSetState extends FilterCubitStates {
  final bool isVegetarian;

  VegetarianSetState(this.isVegetarian);
}

class AllMealsSetState extends FilterCubitStates {
  final bool isAllMeals;

  AllMealsSetState(this.isAllMeals);
}
