import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/controller/meal_cubit/meal_cubit.dart';
import 'package:mennaallah_mohamed/core/utils/app_style.dart';
import 'data_selector.dart';

class DateSection extends StatelessWidget {
  final DateTime selectedDate;
  final void Function(DateTime) onSelectDate;
  final void Function(BuildContext) selectDate;

  const DateSection({
    super.key,
    required this.selectedDate,
    required this.onSelectDate,
    required this.selectDate,
  });

  @override
  Widget build(BuildContext context) {
    DateTime startOfWeek =
        selectedDate.subtract(Duration(days: selectedDate.weekday % 7));
    List<DateTime> weekDates = List.generate(
      7,
      (index) => startOfWeek.add(Duration(days: index)),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
          child: DataSelector(
            selectedMonth: selectedDate,
            selectDate: selectDate,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: SizedBox(
            height: 85.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: weekDates.length,
              itemBuilder: (context, index) {
                DateTime date = weekDates[index];
                bool isSelected = date.day == selectedDate.day &&
                    date.month == selectedDate.month &&
                    date.year == selectedDate.year;

                bool hasMeals = context.read<MealCubit>().hasMealsForDate(date);
                return GestureDetector(
                  onTap: () => onSelectDate(date),
                  child: Container(
                    width: 47.w,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColor.myOrange : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppColor.myOrange
                                    .withAlpha((0.5 * 255).toInt()),
                                blurRadius: 6,
                                spreadRadius: 2,
                              )
                            ]
                          : [],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(DateFormat.E().format(date),
                            style: AppStyle.boldTextStyle.copyWith(
                                color: isSelected ? Colors.white : Colors.black,
                                fontSize: 14.sp)),
                        SizedBox(height: 10.h),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 38.w,
                              height: 38.h,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.black54
                                    : AppColor.myLiteGrey,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Text(
                                  '${date.day}',
                                  style: AppStyle.boldTextStyle.copyWith(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 18.sp),
                                ),
                              ),
                            ),
                            if (hasMeals)
                              Positioned(
                                bottom: 2,
                                child: Container(
                                  width: 6.w,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
