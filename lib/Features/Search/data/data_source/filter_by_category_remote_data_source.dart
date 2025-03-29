import 'package:dio/dio.dart';

abstract class FilterByCategoryRemoteDataSource {
  Future<List<String>> getCategories();
  Future<List<Map<String, dynamic>>> getMealsByCategory(String category);
}

class FilterByCategoryRemoteDataSourceImpl
    implements FilterByCategoryRemoteDataSource {
  final Dio dio;

  FilterByCategoryRemoteDataSourceImpl(this.dio);

  @override
  Future<List<String>> getCategories() async {
    final response = await dio.get(
      'https://www.themealdb.com/api/json/v1/1/list.php?c=list',
    );

    if (response.statusCode == 200 && response.data['meals'] != null) {
      return List<String>.from(
        response.data['meals'].map((json) => json['strCategory']),
      );
    }
    return [];
  }

  @override
  Future<List<Map<String, dynamic>>> getMealsByCategory(String category) async {
    final response = await dio.get(
      'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category',
    );

    if (response.statusCode == 200 && response.data['meals'] != null) {
      return List<Map<String, dynamic>>.from(response.data['meals']);
    }
    return [];
  }
}




