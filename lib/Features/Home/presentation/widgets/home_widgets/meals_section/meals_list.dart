import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Home/data/models/addMeal/add_meal.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/widgets/home_widgets/meals_section/meal_data.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/widgets/home_widgets/meals_section/meal_image.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/widgets/home_widgets/meals_section/remove_meal.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/controller/meal_cubit/meal_cubit.dart';

class MealsList extends StatelessWidget {
  final List<AddMeal> meals;
  final DateTime selectedDate;

  const MealsList({super.key, required this.meals, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final filteredMeals =
        context.read<MealCubit>().getMealsForDate(selectedDate);

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: filteredMeals.length,
      itemBuilder: (context, index) {
        final meal = filteredMeals[index];
        return Padding(
          padding:  EdgeInsets.only(left: 14.w,top: 15.h),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20.h),
                padding: EdgeInsets.only(left: 105.w, top: 16.h, bottom: 16.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.1 * 255).toInt()),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MealData(meal: meal),
                    SizedBox(width: 10.w),
                    RemoveMeal(meal: meal),
                  ],
                ),
              ),
              MealImage(meal: meal),
            ],
          ),
        );
      },
    );
  }
}
