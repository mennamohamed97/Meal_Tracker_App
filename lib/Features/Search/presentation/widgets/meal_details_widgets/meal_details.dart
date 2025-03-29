import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/meal_entity.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/widgets/meal_details_widgets/sliver_adabter.dart';

class MealDetails extends StatelessWidget {
  final MealEntity meal;

  const MealDetails({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 380.h,
          pinned: false,
          floating: false,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () => GoRouter.of(context).pop(context),
            child: Container(
              margin: EdgeInsets.all(9),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.grey.withAlpha((0.4 * 255).toInt()),
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30.sp,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Icon(Icons.favorite_border_rounded,
                  color: Colors.white, size: 30.sp),
            ),
          ],
        ),
        SliverAdapter(meal: meal),
      ],
    );
  }
}
