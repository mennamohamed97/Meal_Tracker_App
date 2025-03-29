import 'package:hive/hive.dart';

part 'add_meal.g.dart';

@HiveType(typeId: 0)
class AddMeal extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String time;

  @HiveField(2)
  final int calories;

  @HiveField(3)
  final String imageUrl;

  @HiveField(4)
  final DateTime date;

  @HiveField(5)
  final String id;

  AddMeal({
    required this.name,
    required this.time,
    required this.calories,
    required this.imageUrl,
    required this.date,
    required this.id,
  });
}
