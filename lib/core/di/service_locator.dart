import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mennaallah_mohamed/Features/Home/data/data_source/home_local_data_source.dart';
import 'package:mennaallah_mohamed/Features/Home/data/models/addMeal/add_meal.dart';
import 'package:mennaallah_mohamed/Features/Home/data/repositories/home_repository_impl.dart';
import 'package:mennaallah_mohamed/Features/Home/domain/repositories/home_repository.dart';
import 'package:mennaallah_mohamed/Features/Home/domain/usecases/delete_meal.dart';
import 'package:mennaallah_mohamed/Features/Home/domain/usecases/get_meals.dart';
import 'package:mennaallah_mohamed/Features/Home/domain/usecases/save_meal.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/controller/meal_cubit/meal_cubit.dart';
import 'package:mennaallah_mohamed/Features/Search/data/data_source/filter_by_category_remote_data_source.dart';
import 'package:mennaallah_mohamed/Features/Search/data/data_source/search_remote_data_source.dart';
import 'package:mennaallah_mohamed/Features/Search/data/repositories/filter_by_category_repository_impl.dart';
import 'package:mennaallah_mohamed/Features/Search/data/repositories/search_repository_impl.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/repositories/filter_by_category_repository.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/repositories/search_repository.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/usecases/filter_by_category.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/usecases/get_categories.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/usecases/search_meals.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/controller/filter_by_category_cubit/filter_by_category_cubit.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/controller/get_categories/get_categories_cubit.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/controller/search_meal_cubit/search_meal_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // Initialize Hive
  await Hive.initFlutter();
  Hive.registerAdapter(AddMealAdapter());
  final mealBox = await Hive.openBox<AddMeal>('meals');

  // dio
  sl.registerLazySingleton<Dio>(() => Dio());

  // Data Source
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(mealBox),
  );
  sl.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<FilterByCategoryRemoteDataSource>(
      () => FilterByCategoryRemoteDataSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));
  sl.registerLazySingleton<SearchRepository>(() => SearchRepositoryImpl(sl()));
  sl.registerLazySingleton<FilterByCategoryRepository>(
      () => FilterByCategoryRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => SaveMeal(sl()));
  sl.registerLazySingleton(() => GetMeals(sl()));
  sl.registerLazySingleton(() => DeleteMeal(sl()));
  sl.registerLazySingleton(() => SearchMeals(sl()));
  sl.registerLazySingleton(() => FilterByCategory(sl()));
  sl.registerLazySingleton(() => GetCategories(sl()));

  // Bloc / Cubit
  sl.registerFactory(() => MealCubit(sl(), sl(), sl()));
  sl.registerFactory(() => SearchMealCubit(sl()));
  sl.registerFactory(() => FilterByCategoryCubit(sl()));
  sl.registerFactory(() => GetCategoriesCubit(sl()));
}
