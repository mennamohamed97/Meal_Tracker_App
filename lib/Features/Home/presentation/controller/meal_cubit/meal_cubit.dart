import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mennaallah_mohamed/Features/Home/data/models/addMeal/add_meal.dart';
import 'package:mennaallah_mohamed/Features/Home/domain/usecases/delete_meal.dart';
import 'package:mennaallah_mohamed/Features/Home/domain/usecases/get_meals.dart';
import 'package:mennaallah_mohamed/Features/Home/domain/usecases/save_meal.dart';
part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  final SaveMeal saveMeal;
  final GetMeals getMeals;
  final DeleteMeal deleteMeal;
  MealSortOption _currentSort = MealSortOption.time;

  MealCubit(this.saveMeal, this.getMeals, this.deleteMeal)
      : super(MealInitial());

  Future<void> loadMeals() async {
    emit(MealLoading());
    try {
      final meals = await getMeals(_currentSort);
      emit(MealLoaded(meals));
    } catch (e) {
      emit(MealError(e.toString()));
    }
  }

  Future<void> addMeal(AddMeal meal) async {
    try {
      await saveMeal(meal);
      loadMeals();
    } catch (e) {
      emit(MealError(e.toString()));
    }
  }

  Future<void> removeMeal(String mealName) async {
    try {
      await deleteMeal(mealName);
      loadMeals();
    } catch (e) {
      emit(MealError(e.toString()));
    }
  }

  void sortMeals(MealSortOption option) {
    _currentSort = option;
    loadMeals();
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  bool hasMealsForDate(DateTime date) {
    if (state is MealLoaded) {
      final meals = (state as MealLoaded).meals;
      return meals.any((meal) => isSameDay(meal.date, date));
    }
    return false;
  }

  List<AddMeal> getMealsForDate(DateTime date) {
    if (state is MealLoaded) {
      final meals = (state as MealLoaded).meals;
      return meals.where((meal) => isSameDay(meal.date, date)).toList();
    }
    return [];
  }

  int getTotalCaloriesForDate(DateTime date) {
    if (state is MealLoaded) {
      final meals = (state as MealLoaded).meals;
      return meals
          .where((meal) => isSameDay(meal.date, date))
          .fold(0, (sum, meal) => sum + meal.calories);
    }
    return 0;
  }
}
