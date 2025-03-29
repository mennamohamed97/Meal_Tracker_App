import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/widgets/home_widgets/app_bar_section.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/widgets/home_widgets/calories_card.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/widgets/home_widgets/date_section.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/widgets/home_widgets/meals_section/meals_section.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/controller/meal_cubit/meal_cubit.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadMealsForSelectedDay();
  }

  _loadMealsForSelectedDay() {
    context.read<MealCubit>().loadMeals();
  }

  _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColor.myOrange,
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.light(
              primary: AppColor.myOrange,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        _loadMealsForSelectedDay();
      });
    }
  }

  Future<void> _handleRefresh() async {
    context.read<MealCubit>().loadMeals();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColor.myOrange,
          onRefresh: _handleRefresh,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                AppBarSection(),
                SizedBox(height: 10.h),
                BlocBuilder<MealCubit, MealState>(
                  builder: (context, state) {
                    return DateSection(
                      selectedDate: selectedDate,
                      onSelectDate: (date) {
                        setState(() {
                          selectedDate = date;
                          _loadMealsForSelectedDay();
                        });
                      },
                      selectDate: _selectDate,
                    );
                  },
                ),
                SizedBox(height: 10.h),
                CaloriesCard(selectedDate: selectedDate),
                SizedBox(height: 20.h),
                MealsSection(selectedDate: selectedDate),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
