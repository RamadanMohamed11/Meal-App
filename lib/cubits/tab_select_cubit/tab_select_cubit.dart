import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/cubits/tab_select_cubit/tab_select_cubit_states.dart';

class TabSelectCubit extends Cubit<TabSelectCubitStates> {
  late int index;
  TabSelectCubit() : super(TabSelectCubitCategoryState()) {
    index = 0;
  }

  void selectTab(int index) {
    this.index = index;
    if (index == 0) {
      emit(TabSelectCubitCategoryState());
    } else if (index == 1) {
      emit(TabSelectCubitFavoritesState());
    }
  }
}
