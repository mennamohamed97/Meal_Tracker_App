import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/usecases/filter_by_category.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/filter_by_category_entity.dart';

part 'filter_by_category_state.dart';

class FilterByCategoryCubit extends Cubit<FilterByCategoryState> {
  final FilterByCategory filterByCategory;
  String? selectedCategory;

  FilterByCategoryCubit(this.filterByCategory)
      : super(FilterByCategoryInitial());

  void fetchMeals(String category) async {
    selectedCategory = category;
    emit(FilterByCategoryLoading());

    try {
      final meals = await filterByCategory(category);
      emit(FilterByCategoryLoaded(meals, selectedCategory: category));
    } catch (e) {
      emit(FilterByCategoryError(e.toString()));
    }
  }

  void selectCategory(String category) {
    selectedCategory = category;
    emit(FilterByCategoryLoaded(
      state is FilterByCategoryLoaded
          ? (state as FilterByCategoryLoaded).meals
          : [],
      selectedCategory: category,
    ));
  }

  void clearSelectedCategory() {
    selectedCategory = null;
    emit(FilterByCategoryInitial());
  }
}
