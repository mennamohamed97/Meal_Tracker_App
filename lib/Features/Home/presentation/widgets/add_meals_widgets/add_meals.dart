import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mennaallah_mohamed/core/app_router/app_router.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';
import 'package:mennaallah_mohamed/core/utils/app_style.dart';
import 'package:uuid/uuid.dart';
import 'package:mennaallah_mohamed/Features/Home/data/models/addMeal/add_meal.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/controller/meal_cubit/meal_cubit.dart';
import 'add_meals_body.dart';
import 'custom_add_meal_button.dart';
import 'custom_meal_image.dart';

class AddMeals extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController timeController;
  final TextEditingController caloriesController;
  final DateTime selectedDay;

  const AddMeals({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.timeController,
    required this.caloriesController,
    required this.selectedDay,
  });

  @override
  Widget build(BuildContext context) {
    String? imagePath;
    return Form(
      key: formKey,
      child: ListView(
        children: [
          Row(
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
                  AppString.addMeal,
                  style: AppStyle.boldTextStyle.copyWith(fontSize: 20.sp),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          Center(
            child: CustomMealImage(
              onImagePicked: (path) {
                imagePath = path;
              },
            ),
          ),
          SizedBox(height: 40.h),
          AddMealsBody(
            nameController: nameController,
            timeController: timeController,
            caloriesController: caloriesController,
          ),
          SizedBox(height: 40.h),
          Center(
            child: CustomAddMealButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final meal = AddMeal(
                    id: Uuid().v4(),
                    name: nameController.text,
                    time: timeController.text,
                    calories: int.tryParse(caloriesController.text) ?? 0,
                    imageUrl: imagePath ?? "",
                    date: selectedDay,
                  );

                  context.read<MealCubit>().addMeal(meal);
                  GoRouter.of(context).push(AppRouter.kHomeScreen);
                  Future.delayed(Duration(milliseconds: 300), () {
                    nameController.clear();
                    timeController.clear();
                    caloriesController.clear();
                    imagePath = "";
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AppString.requiredFields),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
