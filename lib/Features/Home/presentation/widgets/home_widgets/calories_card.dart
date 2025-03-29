import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';
import 'package:mennaallah_mohamed/core/utils/app_style.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/controller/meal_cubit/meal_cubit.dart';

class CaloriesCard extends StatelessWidget {
  final DateTime selectedDate;

  const CaloriesCard({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      height: 240.h,
      decoration: BoxDecoration(
        color: AppColor.lightGreen,
        borderRadius: BorderRadius.circular(35),
      ),
      child: BlocBuilder<MealCubit, MealState>(
        builder: (context, state) {
          int totalCalories =
              context.read<MealCubit>().getTotalCaloriesForDate(selectedDate);

          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      '${AppString.caloriesCard} ${DateFormat.yMMMd().format(selectedDate)}',
                      style: AppStyle.boldTextStyle
                          .copyWith(fontSize: 17.sp, color: Colors.black87)),
                  Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.local_fire_department_outlined,
                        size: 28.sp,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 90.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(totalCalories.toString(),
                              style: AppStyle.boldTextStyle
                                  .copyWith(fontSize: 35.sp)),
                          Text(AppString.kcal, style: AppStyle.textStyle18),
                        ],
                      ),
                    ),
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(
                        begin: 0,
                        end: totalCalories.toDouble(),
                      ),
                      duration: totalCalories == 0
                          ? Duration.zero
                          : Duration(seconds: 2),
                      builder: (context, value, child) {
                        return SfRadialGauge(
                          axes: <RadialAxis>[
                            RadialAxis(
                              minimum: 0,
                              maximum: 2000,
                              startAngle: 150,
                              endAngle: 30,
                              radiusFactor: 0.9,
                              showLabels: false,
                              showTicks: false,
                              axisLineStyle: AxisLineStyle(
                                thickness: 0.23,
                                color:
                                    Colors.black.withAlpha((0.2 * 255).toInt()),
                                thicknessUnit: GaugeSizeUnit.factor,
                                cornerStyle: CornerStyle.bothCurve,
                              ),
                              pointers: <GaugePointer>[
                                RangePointer(
                                  pointerOffset: 0.068,
                                  value: value,
                                  width: 0.10,
                                  color: Colors.black,
                                  sizeUnit: GaugeSizeUnit.factor,
                                  cornerStyle: CornerStyle.bothCurve,
                                ),
                                MarkerPointer(
                                  value: value,
                                  markerType: MarkerType.circle,
                                  color: Colors.black,
                                  markerHeight: 12,
                                  markerWidth: 12,
                                ),
                              ],
                            ),
                            RadialAxis(
                              minimum: 0,
                              maximum: 2000,
                              startAngle: 150,
                              endAngle: 30,
                              radiusFactor: 1.05,
                              showLabels: false,
                              showTicks: false,
                              axisLineStyle: AxisLineStyle(
                                thickness: 4,
                                dashArray: <double>[5, 5],
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
