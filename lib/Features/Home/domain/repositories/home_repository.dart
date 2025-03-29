import 'package:mennaallah_mohamed/Features/Home/data/models/addMeal/add_meal.dart';

abstract class HomeRepository {
  Future<void> saveMeal(AddMeal meal);
  Future<List<AddMeal>> getMeals();
  Future<void> deleteMeal(String mealName);
}
