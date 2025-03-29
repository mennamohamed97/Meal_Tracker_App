import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mennaallah_mohamed/core/app_router/app_router.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';

class AddMealButton extends StatelessWidget {
  final DateTime selectedDay;
  const AddMealButton({super.key, required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColor.myGrey,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            GoRouter.of(context).push(
              AppRouter.kMealScreen,
              extra: selectedDay,
            );
          },
          icon:  Icon(Icons.add, size: 30.sp, color: Colors.black),
        ),
      ),
    );
  }
}
