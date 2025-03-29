import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Home/domain/usecases/get_meals.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/controller/meal_cubit/meal_cubit.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/widgets/home_widgets/add_meal_button.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';

class PopMenu extends StatelessWidget {
  final DateTime selectedDay;

  const PopMenu({super.key, required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PopupMenuButton<MealSortOption>(
          icon: Icon(Icons.filter_list_rounded, size: 30.sp),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onSelected: (option) {
            context.read<MealCubit>().sortMeals(option);
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: MealSortOption.name,
              child: Row(
                children: [
                  Icon(Icons.sort_by_alpha, color: Colors.black54),
                  SizedBox(width: 10.w),
                  Text(AppString.sortByName),
                ],
              ),
            ),
            PopupMenuItem(
              value: MealSortOption.calories,
              child: Row(
                children: [
                  Icon(
                    Icons.local_fire_department,
                    color: Colors.redAccent,
                  ),
                  SizedBox(width: 10.w),
                  Text(AppString.sortByCalories),
                ],
              ),
            ),
            PopupMenuItem(
              value: MealSortOption.time,
              child: Row(
                children: [
                  Icon(Icons.timer, color: Colors.green),
                  SizedBox(width: 10.w),
                  Text(AppString.sortByTime),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: 5.w,
        ),
        AddMealButton(selectedDay: selectedDay),
      ],
    );
  }
}
