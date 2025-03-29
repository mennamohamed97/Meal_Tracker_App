import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/entities/category_entity.dart';
import 'package:mennaallah_mohamed/Features/Search/domain/usecases/get_categories.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  final GetCategories getCategoriesUseCase;

  GetCategoriesCubit(this.getCategoriesUseCase) : super(GetCategoriesInitial());

  Future<void> fetchCategories() async {
    emit(GetCategoriesLoading());
    try {
      final categories = await getCategoriesUseCase();
      emit(GetCategoriesLoaded(categories));
    } catch (e) {
      emit(GetCategoriesError('Failed to load categories'));
    }
  }
}
