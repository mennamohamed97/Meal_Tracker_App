import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/filter_by_category_entity.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/screen/filter_meal_details_screen.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';
import 'package:mennaallah_mohamed/core/utils/app_style.dart';

class FilterList extends StatelessWidget {
  final List<FilterByCategoryEntity> meals;
  const FilterList({super.key, required this.meals});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Found \n${meals.length} results',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(bottom: 20.h),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 0.75,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final meal = meals[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            FilterMealDetailsScreen(meal: meal),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: index % 2 == 0 ? 50 : 0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 160.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    Colors.grey.withAlpha((0.3 * 255).toInt()),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 60.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Text(
                                  meal.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.restaurant,
                                    color: AppColor.myOrange,
                                    size: 20.sp,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    AppString.category,
                                    style: AppStyle.textStyle16
                                        .copyWith(color: AppColor.myOrange),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.map,
                                    color: AppColor.myGreen,
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(AppString.area,
                                      style: AppStyle.textStyle16),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -45.h,
                          left: 30,
                          right: 30,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withAlpha((0.2 * 255).toInt()),
                                  blurRadius: 10,
                                  spreadRadius: 3,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.network(
                                meal.thumbnail,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: meals.length,
            ),
          ),
        ),
      ],
    );
  }
}
