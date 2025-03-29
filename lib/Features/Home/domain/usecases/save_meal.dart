import 'package:mennaallah_mohamed/Features/Home/domain/repositories/home_repository.dart';
import 'package:mennaallah_mohamed/Features/Home/data/models/addMeal/add_meal.dart';

class SaveMeal {
  final HomeRepository repository;

  SaveMeal(this.repository);

  Future<void> call(AddMeal meal) async {
    return await repository.saveMeal(meal);
  }
}
