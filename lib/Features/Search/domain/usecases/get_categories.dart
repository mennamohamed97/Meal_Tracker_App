import 'package:mennaallah_mohamed/Features/Search/domain/repositories/filter_by_category_repository.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/category_entity.dart';

class GetCategories {
  final FilterByCategoryRepository repository;

  GetCategories(this.repository);

  Future<List<CategoryEntity>> call() async {
    return await repository.getCategories();
  }
}
