import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/cubits/filter_cubit/filter_cubit.dart';
import 'package:meal_app/cubits/filter_cubit/filter_cubit_states.dart';
import 'package:meal_app/widgets/custom_switch_widget.dart';

class FiltersPage extends StatelessWidget {
  const FiltersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterCubitStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Filters'), centerTitle: true),
          body: Column(
            children: [
              CustomSwitchWidget(
                title: "Gluten-Free",
                subtitle: "Only include gluten-free meals.",
              ),
              SizedBox(height: 20),
              CustomSwitchWidget(
                title: "Lactose-Free",
                subtitle: "Only include lactose-free meals.",
              ),
              SizedBox(height: 20),

              CustomSwitchWidget(
                title: "Vegetarian",
                subtitle: "Only include vegetarian meals.",
              ),
              SizedBox(height: 20),

              CustomSwitchWidget(
                title: "Vegan",
                subtitle: "Only include vegan meals.",
              ),
              SizedBox(height: 40),

              CustomSwitchWidget(
                title: "All Meals",
                subtitle: "Include all types of meals.",
                isAllMeals: true,
              ),
            ],
          ),
        );
      },
    );
  }
}
