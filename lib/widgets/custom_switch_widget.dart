import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_app/cubits/filter_cubit/filter_cubit.dart';

class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.isAllMeals = false,
  });
  final String title;
  final String subtitle;
  final bool isAllMeals;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      value:
          // (BlocProvider.of<FilterCubit>(context).isAllMeals && !isAllMeals)
          //     ? false
          //     : BlocProvider.of<FilterCubit>(context).getSwitchState(title),
          (BlocProvider.of<FilterCubit>(context).isAllMeals)
              ? true
              : BlocProvider.of<FilterCubit>(context).getSwitchState(title),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 16)),
      onChanged: (value) {
        // if (isAllMeals || !BlocProvider.of<FilterCubit>(context).isAllMeals) {
        //   BlocProvider.of<FilterCubit>(
        //     context,
        //   ).filterSet(title: title, value: value);
        // }
        BlocProvider.of<FilterCubit>(
          context,
        ).filterSet(title: title, value: value);
      },
    );
  }
}
