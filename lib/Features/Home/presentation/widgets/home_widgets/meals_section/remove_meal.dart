import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/controller/meal_cubit/meal_cubit.dart';
import 'package:mennaallah_mohamed/Features/Home/data/models/addMeal/add_meal.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';
import 'package:mennaallah_mohamed/core/utils/app_style.dart';

class RemoveMeal extends StatelessWidget {
  final AddMeal meal;

  const RemoveMeal({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: Text(AppString.removeMeal),
            content: Text(AppString.remove),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: Text(
                  AppString.cancel,
                  style: AppStyle.textStyle16,
                ),
              ),
              TextButton(
                onPressed: () {
                  context.read<MealCubit>().removeMeal(meal.id);
                  Navigator.pop(dialogContext);
                },
                child: Text(AppString.delete,
                    style: AppStyle.textStyle16.copyWith(color: Colors.red)),
              ),
            ],
          ),
        );
      },
      child: Icon(Icons.close, size: 28.sp, color: Colors.black),
    );
  }
}
