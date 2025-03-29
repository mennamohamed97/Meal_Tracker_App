import 'package:equatable/equatable.dart';

class MealEntity extends Equatable {
  final String id;
  final String name;
  final String category;
  final String area;
  final String? instructions;
  final String? thumbnail;
  final String? tags;
  final String? youtubeUrl;
  final List<String> ingredients;
  final List<String> measures;
  final String? source;
  final String? imageSource;
  final String? creativeCommonsConfirmed;
  final String? dateModified;

  const MealEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    this.instructions,
    this.thumbnail,
    this.tags,
    this.youtubeUrl,
    required this.ingredients,
    required this.measures,
    this.source,
    this.imageSource,
    this.creativeCommonsConfirmed,
    this.dateModified,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        area,
        instructions,
        thumbnail,
        tags,
        youtubeUrl,
        ingredients,
        measures,
        source,
        imageSource,
        creativeCommonsConfirmed,
        dateModified,
      ];
}
