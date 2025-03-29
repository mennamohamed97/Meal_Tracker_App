import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Home/data/models/addMeal/add_meal.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';
import 'package:mennaallah_mohamed/core/utils/app_style.dart';

class MealData extends StatelessWidget {
  final AddMeal meal;
  const MealData({super.key, required this.meal});

  String convertKcalToGrams(int kcal) {
    double grams = kcal / 7;
    return grams.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(meal.name, style: AppStyle.boldTextStyle.copyWith(fontSize: 22.sp)),
        SizedBox(height: 5.h),
        Row(
          children: [
            Icon(
              Icons.local_fire_department,
              color: Colors.redAccent,
              size: 20.sp,
            ),
            Text(
              "${meal.calories} ${AppString.kcal} · ${convertKcalToGrams(meal.calories)}g",
              style: AppStyle.textStyle14,
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            Icon(Icons.access_time, size: 18.sp),
            SizedBox(width: 5.w),
            Text(meal.time, style: AppStyle.textStyle14),
          ],
        ),
      ],
    );
  }
}
