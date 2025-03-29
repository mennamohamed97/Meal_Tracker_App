import 'package:flutter/material.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';
import 'package:mennaallah_mohamed/core/components/custom_text_field.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';

class TimeField extends StatelessWidget {
  final TextEditingController timeController;

  const TimeField({super.key, required this.timeController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField.buildTextFormField(
      controller: timeController,
      labelText: AppString.mealTime,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppString.requiredTime;
        }
        return null;
      },
      prefixIcon: const Icon(Icons.timer),
      readOnly: true,
      onTap: () async {
        FocusScope.of(context).requestFocus(FocusNode());

        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: (context, child) {
            return Theme(
              data: ThemeData(
                colorScheme: ColorScheme.light(
                  primary: AppColor.myGreen,
                  onPrimary: Colors.white,
                  onSurface: AppColor.myGreen,
                ),
                dialogBackgroundColor: Colors.white,
                timePickerTheme: TimePickerThemeData(
                  backgroundColor: Colors.white,
                  hourMinuteColor: Colors.black12,
                  hourMinuteTextColor: Colors.black,
                  dialHandColor: Colors.black,
                  dialBackgroundColor: Colors.grey[200],
                  entryModeIconColor: Colors.black,
                  dayPeriodColor: WidgetStateColor.resolveWith((states) =>
                      states.contains(WidgetState.selected)
                          ? Colors.black
                          : Colors.grey[300]!),
                  dayPeriodTextColor: WidgetStateColor.resolveWith((states) =>
                      states.contains(WidgetState.selected)
                          ? Colors.white
                          : Colors.black),
                ),
              ),
              child: child!,
            );
          },
        );
        if (pickedTime != null && context.mounted) {
          timeController.text = pickedTime.format(context);
        }
      },
    );
  }
}
