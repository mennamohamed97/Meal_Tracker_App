import 'package:mennaallah_mohamed/Features/Home/domain/repositories/home_repository.dart';

class DeleteMeal {
  final HomeRepository repository;

  DeleteMeal(this.repository);

  Future<void> call(String mealName) async {
    return await repository.deleteMeal(mealName);
  }
}
