import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/widgets/add_meals_widgets/time_field.dart';
import 'package:mennaallah_mohamed/core/components/custom_text_field.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';

class AddMealsBody extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController timeController;
  final TextEditingController caloriesController;
  const AddMealsBody({
    super.key,
    required this.nameController,
    required this.timeController,
    required this.caloriesController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        CustomTextField.buildTextFormField(
          controller: nameController,
          labelText: AppString.mealName,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppString.requiredName;
            }
            return null;
          },
          prefixIcon: const Icon(Icons.restaurant_menu),
        ),
        const SizedBox(height: 20),
        CustomTextField.buildTextFormField(
          controller: caloriesController,
          labelText: AppString.mealCalories,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppString.requiredCalories;
            }
            if (int.tryParse(value) == null || int.parse(value) <= 0) {
              return AppString.validCalories;
            }
            return null;
          },
          prefixIcon: const Icon(Icons.local_fire_department),
        ),
        SizedBox(height: 20.h),
        TimeField(timeController: timeController),
        SizedBox(height: 20.h),
      ],
    );
  }
}
