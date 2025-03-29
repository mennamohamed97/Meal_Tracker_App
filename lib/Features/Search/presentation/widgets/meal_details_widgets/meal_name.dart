import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/meal_entity.dart';
import 'package:mennaallah_mohamed/core/functions/launch_url.dart';

class MealName extends StatelessWidget {
  final MealEntity meal;
  const MealName({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          meal.name,
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () async {
            openURL(meal.youtubeUrl!);
          },
          child: Icon(
            FontAwesomeIcons.youtube,
            color: Colors.red,
            size: 30.sp,
          ),
        ),
      ],
    );
  }
}
