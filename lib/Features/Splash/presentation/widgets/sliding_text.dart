import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';
import 'package:mennaallah_mohamed/core/utils/app_style.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Padding(
            padding: EdgeInsets.only(right: 40.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppString.splash1, style: AppStyle.textStyle70),
                Text(
                  AppString.splash2,
                  style:
                      AppStyle.textStyle70.copyWith(color: AppColor.lightGreen),
                ),
                Text(AppString.splash3, style: AppStyle.textStyle70),
              ],
            ),
          ),
        );
      },
    );
  }
}
