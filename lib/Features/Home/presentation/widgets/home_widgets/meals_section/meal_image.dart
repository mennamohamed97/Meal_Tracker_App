import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Home/data/models/addMeal/add_meal.dart';
import 'package:mennaallah_mohamed/core/utils/app_image.dart';

class MealImage extends StatelessWidget {
  final AddMeal meal;
  const MealImage({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -20,
      top: -4.5,
      child: Container(
        width: 125.w,
        height: 125.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.2 * 255).toInt()),
              blurRadius: 10,
              spreadRadius: 3,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipOval(
          child: meal.imageUrl.isNotEmpty
              ? Image.file(
                  File(meal.imageUrl),
                  width: 125.w,
                  height: 125.h,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  AppImage.noImage,
                  width: 125.w,
                  height: 125.h,
                  fit: BoxFit.fill,
                ),
        ),
      ),
    );
  }
}
