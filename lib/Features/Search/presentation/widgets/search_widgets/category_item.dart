import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/category_entity.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/controller/filter_by_category_cubit/filter_by_category_cubit.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/controller/search_meal_cubit/search_meal_cubit.dart';
import 'package:mennaallah_mohamed/core/utils/app_color.dart';
import 'package:mennaallah_mohamed/core/utils/app_image.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity category;
  final TextEditingController searchController;

  const CategoryItem(
      {super.key, required this.category, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterByCategoryCubit, FilterByCategoryState>(
      builder: (context, state) {
        final selectedCategory =
            state is FilterByCategoryLoaded ? state.selectedCategory : null;
        final isSelected = selectedCategory == category.name;

        return GestureDetector(
          onTap: () {
            searchController.clear();
            context.read<SearchMealCubit>().clearSearch();
            context.read<FilterByCategoryCubit>().selectCategory(category.name);
            context.read<FilterByCategoryCubit>().fetchMeals(category.name);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha((0.1 * 255).toInt()),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Chip(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                backgroundColor:
                    isSelected ? AppColor.lightGreen : Colors.white,
                avatar: CircleAvatar(
                  backgroundImage: NetworkImage(
                    category.imageUrls.isNotEmpty
                        ? category.imageUrls
                        : AppImage.noCategoryImage,
                  ),
                  backgroundColor: Colors.transparent,
                ),
                label: Text(
                  category.name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
