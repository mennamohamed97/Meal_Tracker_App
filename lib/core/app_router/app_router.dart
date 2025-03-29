import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/screen/home_screen.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/screen/meal_screen.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/controller/get_categories/get_categories_cubit.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/controller/search_meal_cubit/search_meal_cubit.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/screen/search_screen.dart';
import 'package:mennaallah_mohamed/Features/Splash/presentation/screen/splash_screen.dart';
import 'package:mennaallah_mohamed/Features/Home/presentation/controller/meal_cubit/meal_cubit.dart';
import 'package:mennaallah_mohamed/core/di/service_locator.dart';
import 'package:mennaallah_mohamed/Features/Onboarding/presentation/screen/onboarding_screen.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/meal_entity.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/screen/meal_details_screen.dart';
import 'package:mennaallah_mohamed/Features/Search/presentation/controller/filter_by_category_cubit/filter_by_category_cubit.dart';

abstract class AppRouter {
  static const kSplashScreen = '/';
  static const kOnBoardingScreen = '/OnBoardingScreen';
  static const kMealScreen = '/MealScreen';
  static const kHomeScreen = '/HomeScreen';
  static const kSearchScreen = '/SearchScreen';
  static const kMealDetailsScreen = '/MealDetailsScreen';

  static final router = GoRouter(
    initialLocation: AppRouter.kSplashScreen,
    routes: [
      GoRoute(path: kSplashScreen, builder: (context, state) => SplashScreen()),
      GoRoute(
        path: kOnBoardingScreen,
        builder: (context, state) => OnboardingScreen(),
      ),
      GoRoute(
        path: kHomeScreen,
        builder: (context, state) => BlocProvider(
          create: (_) => sl<MealCubit>()..loadMeals(),
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: kSearchScreen,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => sl<SearchMealCubit>(),
            ),
            BlocProvider(
              create: (context) => sl<GetCategoriesCubit>()..fetchCategories(),
            ),
            BlocProvider(
              create: (context) => sl<FilterByCategoryCubit>(),
            ),
          ],
          child: SearchScreen(),
        ),
      ),
      GoRoute(
        path: '$kMealDetailsScreen/:mealId',
        builder: (context, state) {
          final meal = state.extra as MealEntity;
          return MealDetailsScreen(meal: meal);
        },
      ),
      GoRoute(
        path: kMealScreen,
        builder: (context, state) {
          final DateTime selectedDay = state.extra as DateTime;
          return BlocProvider(
            create: (_) => sl<MealCubit>(),
            child: MealScreen(selectedDay: selectedDay),
          );
        },
      ),
    ],
  );
}
