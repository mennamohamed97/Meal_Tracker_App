import 'package:dio/dio.dart';
import 'package:mennaallah_mohamed/Features/Search/data/models/meal_model.dart';

abstract class SearchRemoteDataSource {
  Future<List<MealModel>> searchMealByName(String name);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final Dio dio;

  SearchRemoteDataSourceImpl(this.dio);

  @override
  Future<List<MealModel>> searchMealByName(String name) async {
    final response = await dio.get(
      'https://www.themealdb.com/api/json/v1/1/search.php?s=$name',
    );
    if (response.statusCode == 200) {
      final meals = response.data['meals'];
      if (meals != null) {
        return MealModel.fromJsonList(meals);
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
