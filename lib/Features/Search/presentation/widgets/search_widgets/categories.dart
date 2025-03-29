import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/controller/filter_by_category_cubit/filter_by_category_cubit.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/controller/get_categories/get_categories_cubit.dart';
import 'package:mennaallah_mohamed/core/components/loading_indicator.dart';
import 'category_item.dart';

class Categories extends StatelessWidget {
  final TextEditingController searchController;

  const Categories({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
      builder: (context, state) {
        if (state is GetCategoriesLoading) {
          return Center(child: buildLoadingIndicator(width: 80, height: 80));
        } else if (state is GetCategoriesLoaded) {
          return SizedBox(
            height: 50.h,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) {
                      final category = state.categories[index];
                      return CategoryItem(
                        category: category,
                        searchController: searchController,
                      );
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.filter_alt_off, size: 24.sp),
                  onPressed: () {
                    context
                        .read<FilterByCategoryCubit>()
                        .clearSelectedCategory();
                  },
                ),
              ],
            ),
          );
        } else if (state is GetCategoriesError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox.shrink();
      },
    );
  }
}
