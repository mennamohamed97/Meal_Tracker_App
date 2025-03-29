import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/meal_entity.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/widgets/meal_details_widgets/ingredients_list.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/widgets/meal_details_widgets/meal_info.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/widgets/meal_details_widgets/meal_name.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';
import 'package:mennaallah_mohamed/core/utils/app_style.dart';

class SliverAdapter extends StatelessWidget {
  final MealEntity meal;

  const SliverAdapter({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(50.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MealName(meal: meal),
            SizedBox(height: 10.h),
            MealInfo(meal: meal),
            SizedBox(height: 20.h),
            Text(AppString.details,
                style:
                    AppStyle.textStyle18.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: 10.h),
            Text(meal.instructions!,
                style: AppStyle.textStyle14.copyWith(color: Colors.grey)),
            SizedBox(height: 20.h),
            Text(AppString.ingredients,
                style:
                    AppStyle.textStyle18.copyWith(fontWeight: FontWeight.bold)),
            SizedBox(height: 10.h),
            IngredientsList(meal: meal),
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
