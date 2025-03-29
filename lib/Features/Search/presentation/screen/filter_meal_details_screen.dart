import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/filter_by_category_entity.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';

class FilterMealDetailsScreen extends StatelessWidget {
  final FilterByCategoryEntity meal;

  const FilterMealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            width: double.infinity,
            height: 460.h,
            meal.thumbnail,
            fit: BoxFit.fill,
          ),
          CustomScrollView(
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
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(top: 50.h, left: 20.w, right: 20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50.r)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            meal.name,
                            style: TextStyle(
                                fontSize: 22.sp, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () async {
                              // openURL(meal.youtubeUrl!);
                            },
                            child: Icon(
                              FontAwesomeIcons.youtube,
                              color: Colors.red,
                              size: 30.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.restaurant,
                                  color: AppColor.myOrange, size: 18.sp),
                              SizedBox(width: 5.w),
                              Text("category",
                                  style: TextStyle(fontSize: 14.sp)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.local_fire_department,
                                  color: Colors.red, size: 18.sp),
                              SizedBox(width: 5.w),
                              Text('_ Kcal', style: TextStyle(fontSize: 14.sp)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.flag,
                                  color: AppColor.lightGreen, size: 18.sp),
                              SizedBox(width: 5.w),
                              Text("area", style: TextStyle(fontSize: 14.sp)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Text("Details",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10.h),
                      Text("instructions",
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.grey)),
                      SizedBox(height: 20.h),
                      Text("Ingredients",
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 120.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 90.w,
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey
                                        .withAlpha((0.3 * 255).toInt()),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(15.r)),
                                      ),
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Text(
                                        "ingredient ${index + 1}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.lightGreen,
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                      ),
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Text(
                                        "measure ${index + 1}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
