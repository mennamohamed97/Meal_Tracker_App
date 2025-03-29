import 'package:mennaallah_mohamed/Features/Search/domain/entities/meal_entity.dart';

abstract class SearchRepository {
  Future<List<MealEntity>> searchMealByName(String name);
}
