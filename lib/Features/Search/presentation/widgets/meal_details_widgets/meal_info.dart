import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/meal_entity.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';

class MealInfo extends StatelessWidget {
  final MealEntity meal;
  const MealInfo({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.restaurant, color: AppColor.myOrange, size: 18.sp),
            SizedBox(width: 5.w),
            Text(meal.category, style: TextStyle(fontSize: 14.sp)),
          ],
        ),
        Row(
          children: [
            Icon(Icons.local_fire_department, color: Colors.red, size: 18.sp),
            SizedBox(width: 5.w),
            Text('_${AppString.kcal}', style: TextStyle(fontSize: 14.sp)),
          ],
        ),
        Row(
          children: [
            Icon(Icons.flag, color: AppColor.lightGreen, size: 18.sp),
            SizedBox(width: 5.w),
            Text(meal.area, style: TextStyle(fontSize: 14.sp)),
          ],
        ),
      ],
    );
  }
}
