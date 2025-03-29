import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/widgets/home_widgets/meals_section/pop_menu.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';
import 'package:mennaallah_mohamed/core/utils/app_style.dart';

class MealsBar extends StatelessWidget {
  final DateTime selectedDay;

  const MealsBar({super.key, required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppString.meals,
              style: AppStyle.boldTextStyle.copyWith(fontSize: 30.sp)),
          PopMenu(selectedDay: selectedDay)
        ],
      ),
    );
  }
}
