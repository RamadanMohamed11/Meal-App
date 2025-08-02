import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meal_app/constants.dart';
import 'package:meal_app/cubits/fav_cubit/fav_cubit.dart';
import 'package:meal_app/cubits/filter_cubit/filter_cubit.dart';
import 'package:meal_app/cubits/tab_select_cubit/tab_select_cubit.dart';
import 'package:meal_app/pages/tabs_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(kFavBoxName);
  await Hive.openBox<bool>(kFilterBoxName);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MealApp());
}

class MealApp extends StatelessWidget {
  const MealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabSelectCubit>(create: (context) => TabSelectCubit()),
        BlocProvider<FavCubit>(create: (context) => FavCubit()),
        BlocProvider<FilterCubit>(create: (context) => FilterCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        debugShowCheckedModeBanner: false,
        home: TabsPage(),
      ),
    );
  }
}
