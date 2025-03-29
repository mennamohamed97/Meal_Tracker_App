import 'package:hive_flutter/adapters.dart';
import 'package:mennaallah_mohamed/Features/Home/data/models/addMeal/add_meal.dart';

abstract class HomeLocalDataSource {
  Future<void> saveMeal(AddMeal meal);
  Future<List<AddMeal>> getMeals();
  Future<void> deleteMeal(String mealName);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final Box<AddMeal> mealBox;

  HomeLocalDataSourceImpl(this.mealBox);

  @override
  Future<void> saveMeal(AddMeal meal) async {
    await mealBox.put(meal.id, meal);
  }

  @override
  Future<List<AddMeal>> getMeals() async {
    return mealBox.values.toList();
  }

  @override
  Future<void> deleteMeal(String mealName) async {
    await mealBox.delete(mealName);
  }
}
