import 'package:mennaallah_mohamed/Features/Search/domain/repositories/filter_by_category_repository.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/filter_by_category_entity.dart';

class FilterByCategory {
  final FilterByCategoryRepository repository;

  FilterByCategory(this.repository);

  Future<List<FilterByCategoryEntity>> call(String category) {
    return repository.getMealsByCategory(category);
  }
}
