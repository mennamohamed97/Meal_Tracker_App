import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/widgets/home_widgets/meals_section/enter_meals.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/controller/meal_cubit/meal_cubit.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/widgets/home_widgets/meals_section/meals_bar.dart';
import 'package:mennaallah_mohamed/core/components/loading_indicator.dart';
import 'error_loading_meals.dart';
import 'meals_list.dart';

class MealsSection extends StatelessWidget {
  final DateTime selectedDate;

  const MealsSection({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MealsBar(selectedDay: selectedDate),
        BlocBuilder<MealCubit, MealState>(
          builder: (context, state) {
            if (state is MealLoading) {
              return Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: Center(
                    child: buildLoadingIndicator(width: 100, height: 100)),
              );
            }
            if (state is MealLoaded) {
              final hasMeals =
                  context.read<MealCubit>().hasMealsForDate(selectedDate);

              return hasMeals
                  ? MealsList(meals: state.meals, selectedDate: selectedDate)
                  : const EnterMeals();
            }
            return const ErrorLoadingMeals();
          },
        ),
      ],
    );
  }
}
