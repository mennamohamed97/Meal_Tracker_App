import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:mennaallah_mohamed/Features/Home/domain/repositories/home_repository.dart';
import 'package:mennaallah_mohamed/Features/Home/data/models/addMeal/add_meal.dart';

enum MealSortOption { name, calories, time }

class GetMeals {
  final HomeRepository repository;

  GetMeals(this.repository);

  Future<List<AddMeal>> call(MealSortOption sortOption) async {
    final meals = await repository.getMeals();
    return _applySorting(meals, sortOption);
  }

  List<AddMeal> _applySorting(List<AddMeal> meals, MealSortOption option) {
    List<AddMeal> sortedMeals = List.from(meals);
    switch (option) {
      case MealSortOption.name:
        sortedMeals.sort((a, b) => a.name.compareTo(b.name));
        break;
      case MealSortOption.calories:
        sortedMeals.sort((a, b) => a.calories.compareTo(b.calories));
        break;
      case MealSortOption.time:
        DateFormat format = DateFormat("hh:mm a");
        sortedMeals.sort((a, b) {
          try {
            DateTime timeA = format.parse(a.time);
            DateTime timeB = format.parse(b.time);
            return timeA.compareTo(timeB);
          } catch (e) {
            log("Error parsing time: $e");
            return 0;
          }
        });
        break;
    }
    return sortedMeals;
  }
}
