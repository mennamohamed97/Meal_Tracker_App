part of 'search_meal_cubit.dart';

abstract class SearchMealState {}

class SearchMealInitial extends SearchMealState {}

class SearchMealLoading extends SearchMealState {}

class SearchMealLoaded extends SearchMealState {
  final List<MealEntity> meals;

  SearchMealLoaded(this.meals);
}

class SearchMealError extends SearchMealState {
  final String message;

  SearchMealError(this.message);
}
