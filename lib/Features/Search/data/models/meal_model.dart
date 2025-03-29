import 'package:mennaallah_mohamed/Features/Search/domain/entities/meal_entity.dart';

class MealModel extends MealEntity {
  const MealModel({
    required super.id,
    required super.name,
    required super.category,
    required super.area,
    super.instructions,
    super.thumbnail,
    super.tags,
    super.youtubeUrl,
    required super.ingredients,
    required super.measures,
    super.source,
    super.imageSource,
    super.creativeCommonsConfirmed,
    super.dateModified,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];

    for (int i = 1; i <= 20; i++) {
      String? ingredient = json['strIngredient$i'];
      String? measure = json['strMeasure$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
        measures.add(measure ?? '');
      }
    }

    return MealModel(
      id: json['idMeal'],
      name: json['strMeal'],
      category: json['strCategory'],
      area: json['strArea'],
      instructions: json['strInstructions'],
      thumbnail: json['strMealThumb'],
      tags: json['strTags'],
      youtubeUrl: json['strYoutube'],
      ingredients: ingredients,
      measures: measures,
      source: json['strSource'],
      imageSource: json['strImageSource'],
      creativeCommonsConfirmed: json['strCreativeCommonsConfirmed'],
      dateModified: json['dateModified'],
    );
  }

  static List<MealModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MealModel.fromJson(json)).toList();
  }
}
