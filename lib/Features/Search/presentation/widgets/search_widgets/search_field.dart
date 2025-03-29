import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/controller/filter_by_category_cubit/filter_by_category_cubit.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';
import 'package:mennaallah_mohamed/core/utils/app_string.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/controller/search_meal_cubit/search_meal_cubit.dart';

class SearchField extends StatelessWidget {
  final TextEditingController searchController;

  const SearchField({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      cursorColor: AppColor.myGreen,
      decoration: InputDecoration(
        hintText: AppString.searchMealHint,
        prefixIcon: const Icon(Icons.search_rounded),
        suffixIcon: IconButton(
            onPressed: () {
              searchController.clear();
              context.read<SearchMealCubit>().clearSearch();
            },
            icon: const Icon(Icons.clear)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide(color: AppColor.myGreen, width: 2.w),
        ),
      ),
      onChanged: (value) {
        context.read<FilterByCategoryCubit>().clearSelectedCategory();
        context.read<SearchMealCubit>().searchMeals(value);
      },
    );
  }
}
