import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/widgets/search_widgets/categories.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/widgets/search_widgets/result_list_section.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/widgets/search_widgets/search_screen_bar.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/widgets/search_widgets/search_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchScreenBar(),
              SizedBox(height: 15.h),
              SearchField(searchController: searchController),
              SizedBox(height: 15.h),
              Categories(searchController: searchController),
              SizedBox(height: 15.h),
              ResultListSection(),
            ],
          ),
        ),
      ),
    );
  }
}
