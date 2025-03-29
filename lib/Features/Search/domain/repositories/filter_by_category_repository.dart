import 'package:mennaallah_mohamed/Features/Search/domain/entities/category_entity.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/filter_by_category_entity.dart';

abstract class FilterByCategoryRepository {
  Future<List<CategoryEntity>> getCategories();
  Future<List<FilterByCategoryEntity>> getMealsByCategory(String category);
}
