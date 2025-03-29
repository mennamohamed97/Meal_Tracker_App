import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/meal_entity.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/usecases/search_meals.dart';

part 'search_meal_state.dart';

class SearchMealCubit extends Cubit<SearchMealState> {
  final SearchMeals searchMealsUseCase;
  String _searchQuery = '';

  SearchMealCubit(this.searchMealsUseCase) : super(SearchMealInitial());

  String get searchQuery => _searchQuery;

  void searchMeals(String query) async {
    if (query.isEmpty) {
      emit(SearchMealInitial());
      return;
    }

    _searchQuery = query;
    emit(SearchMealLoading());

    try {
      final meals = await searchMealsUseCase.call(query);
      emit(SearchMealLoaded(meals));
    } catch (e) {
      emit(SearchMealError(e.toString()));
    }
  }
  void clearSearch() {
    _searchQuery = '';
    emit(SearchMealInitial());
  }

}
