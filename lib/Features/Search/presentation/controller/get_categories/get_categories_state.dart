part of 'get_categories_cubit.dart';

abstract class GetCategoriesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCategoriesInitial extends GetCategoriesState {}

class GetCategoriesLoading extends GetCategoriesState {}

class GetCategoriesLoaded extends GetCategoriesState {
  final List<CategoryEntity> categories;
  GetCategoriesLoaded(this.categories);

  @override
  List<Object?> get props => [categories];
}

class GetCategoriesError extends GetCategoriesState {
  final String message;
  GetCategoriesError(this.message);

  @override
  List<Object?> get props => [message];
}
