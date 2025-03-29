import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';
import 'package:mennaallah_mohamed/core/utils/app_style.dart';

class DataSelector extends StatefulWidget {
  final DateTime selectedMonth;
  final void Function(BuildContext) selectDate;

  const DataSelector(
      {super.key, required this.selectDate, required this.selectedMonth});

  @override
  State<DataSelector> createState() => _DataSelectorState();
}

class _DataSelectorState extends State<DataSelector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.selectDate(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColor.myGrey,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha((0.1 * 255).toInt()),
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.calendar_today, color: Colors.black54, size: 20.sp),
            SizedBox(width: 8.w),
            Text(
              DateFormat('MMMM').format(widget.selectedMonth),
              style: AppStyle.boldTextStyle.copyWith(fontSize: 16.sp),
            ),
            SizedBox(width: 4.w),
            const Icon(Icons.arrow_drop_down, color: Colors.black54),
          ],
        ),
      ),
    );
  }
}
