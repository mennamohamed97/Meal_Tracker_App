import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mennaallah_mohamed/core/components/loading_indicator.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/controller/filter_by_category_cubit/filter_by_category_cubit.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/controller/search_meal_cubit/search_meal_cubit.dart';
import 'filter_list.dart';
import 'meal_list.dart';

class ResultListSection extends StatelessWidget {
  const ResultListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FilterByCategoryCubit, FilterByCategoryState>(
        builder: (context, filterState) {
          return BlocBuilder<SearchMealCubit, SearchMealState>(
            builder: (context, searchState) {
              final searchCubit = context.read<SearchMealCubit>();

              if (searchState is SearchMealLoaded &&
                  searchCubit.searchQuery.isNotEmpty) {
                return MealList(
                  meals: searchState.meals,
                );
              } else if (searchState is SearchMealLoading) {
                return Center(
                    child: buildLoadingIndicator(width: 150, height: 150));
              } else if (searchState is SearchMealError) {
                return Center(child: Text("Error: ${searchState.message}"));
              } else if (filterState is FilterByCategoryLoaded) {
                return FilterList(meals: filterState.meals);
              } else if (filterState is FilterByCategoryLoading) {
                return Center(
                    child: buildLoadingIndicator(width: 150, height: 150));
              } else if (filterState is FilterByCategoryError) {
                return Center(child: Text("Error: ${filterState.message}"));
              } else {
                return Center(
                  child: Lottie.asset(
                    'assets/lottie/search.json',
                    width: 300.w,
                    height: 300.h,
                    fit: BoxFit.fill,
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}
