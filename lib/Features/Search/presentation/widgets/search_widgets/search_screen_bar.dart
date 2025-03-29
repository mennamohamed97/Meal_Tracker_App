import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';
import 'package:mennaallah_mohamed/core/utils/app_style.dart';

class SearchScreenBar extends StatelessWidget {
  const SearchScreenBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30.sp,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: Text(
            AppString.searchMeal,
            style: AppStyle.boldTextStyle.copyWith(fontSize: 20.sp),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
