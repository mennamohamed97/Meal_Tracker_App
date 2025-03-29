import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/core/utils/app_style.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';

class ErrorLoadingMeals extends StatelessWidget {
  const ErrorLoadingMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 85.h),
        child: Text(
         AppString.mealError,
          style: AppStyle.textStyle16,
        ),
      ),
    );
  }
}
