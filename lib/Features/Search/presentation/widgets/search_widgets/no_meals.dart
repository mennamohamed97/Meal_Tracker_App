import 'package:flutter/material.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';
import 'package:mennaallah_mohamed/core/utils/app_style.dart';

class NoMeals extends StatelessWidget {
  const NoMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppString.noMeal,
        style: AppStyle.textStyle16,
      ),
    );
  }
}
