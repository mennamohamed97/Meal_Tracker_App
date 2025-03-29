import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';
import 'package:mennaallah_mohamed/core/utils/app_image.dart';
import 'package:mennaallah_mohamed/core/app_router/app_router.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipOval(
            child: Image.asset(
              AppImage.profile,
              width: 50.w,
              height: 50.h,
              fit: BoxFit.cover,
            ),
          ),
          Container(
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
                    AppRouter.kSearchScreen,
                  );
                },
                icon: Icon(
                  Icons.search_rounded,
                  size: 30.sp,
                  color: Colors.black45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
