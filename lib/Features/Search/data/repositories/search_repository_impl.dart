import 'package:mennaallah_mohamed/Features/Search/data/data_source/search_remote_data_source.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/repositories/search_repository.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/meal_entity.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MealEntity>> searchMealByName(String name) async {
    final result = await remoteDataSource.searchMealByName(name);
    return result;
  }
}
