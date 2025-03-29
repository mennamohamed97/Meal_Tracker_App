part of 'filter_by_category_cubit.dart';

abstract class FilterByCategoryState {}

class FilterByCategoryInitial extends FilterByCategoryState {}

class FilterByCategoryLoading extends FilterByCategoryState {}

class FilterByCategoryLoaded extends FilterByCategoryState {
  final List<FilterByCategoryEntity> meals;
  final String? selectedCategory;

  FilterByCategoryLoaded(this.meals, {this.selectedCategory});
}

class FilterByCategoryError extends FilterByCategoryState {
  final String message;

  FilterByCategoryError(this.message);
}
