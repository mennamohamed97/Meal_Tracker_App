import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/meal_entity.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/widgets/meal_details_widgets/meal_details.dart';

class MealDetailsScreen extends StatelessWidget {
  final MealEntity meal;

  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            width: double.infinity,
            height: 460.h,
            meal.thumbnail!,
            fit: BoxFit.fill,
          ),
          MealDetails(meal: meal),
        ],
      ),
    );
  }
}
