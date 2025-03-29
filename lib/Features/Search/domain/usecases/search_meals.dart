import 'package:mennaallah_mohamed/Features/Search/domain/entities/meal_entity.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/repositories/search_repository.dart';

class SearchMeals {
  final SearchRepository repository;

  SearchMeals(this.repository);

  Future<List<MealEntity>> call(String name) {
    return repository.searchMealByName(name);
  }
}
