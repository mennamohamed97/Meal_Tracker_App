import 'package:mennaallah_mohamed/Features/Search/data/data_source/filter_by_category_remote_data_source.dart';
import 'package:mennaallah_mohamed/Features/Search/data/models/filter_by_category_model.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/repositories/filter_by_category_repository.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/category_entity.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/filter_by_category_entity.dart';
import 'package:mennaallah_mohamed/Features/Search/data/models/category_model.dart';

class FilterByCategoryRepositoryImpl implements FilterByCategoryRepository {
  final FilterByCategoryRemoteDataSource remoteDataSource;

  FilterByCategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final result = await remoteDataSource.getCategories();
    return result
        .map((json) => CategoryModel.fromJson({'strCategory': json}))
        .toList();
  }

  @override
  Future<List<FilterByCategoryEntity>> getMealsByCategory(
      String category) async {
    final result = await remoteDataSource.getMealsByCategory(category);
    return result.map((json) => FilterByCategoryModel.fromJson(json)).toList();
  }
}
