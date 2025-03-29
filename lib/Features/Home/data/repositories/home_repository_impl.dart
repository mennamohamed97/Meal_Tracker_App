import 'package:mennaallah_mohamed/Features/Home/domain/repositories/home_repository.dart';
import 'package:mennaallah_mohamed/Features/Home/data/data_source/home_local_data_source.dart';
import 'package:mennaallah_mohamed/Features/Home/data/models/addMeal/add_meal.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveMeal(AddMeal meal) async {
    return await localDataSource.saveMeal(meal);
  }

  @override
  Future<List<AddMeal>> getMeals() async {
    return await localDataSource.getMeals();
  }

  @override
  Future<void> deleteMeal(String mealName) async {
    return await localDataSource.deleteMeal(mealName);
  }
}
