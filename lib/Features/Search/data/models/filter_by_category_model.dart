import 'package:mennaallah_mohamed/Features/Search/domain/entities/filter_by_category_entity.dart';

class FilterByCategoryModel extends FilterByCategoryEntity {
  const FilterByCategoryModel({
    required super.id,
    required super.name,
    required super.thumbnail,
  });

  factory FilterByCategoryModel.fromJson(Map<String, dynamic> json) {
    return FilterByCategoryModel(
      id: json['idMeal'],
      name: json['strMeal'],
      thumbnail: json['strMealThumb'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idMeal': id,
      'strMeal': name,
      'strMealThumb': thumbnail,
    };
  }
}
