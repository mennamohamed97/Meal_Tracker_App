import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/widgets/add_meals_widgets/add_meals.dart';

class MealScreen extends StatelessWidget {
  final DateTime selectedDay;
  MealScreen({super.key, required this.selectedDay});
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: AddMeals(
            formKey: formKey,
            nameController: nameController,
            timeController: timeController,
            caloriesController: caloriesController,
            selectedDay: selectedDay,
          ),
        ),
      ),
    );
  }
}
