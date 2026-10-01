
class GetSlidersLoading extends HomeState {}
class GetSlidersSuccess extends HomeState {}
class GetSlidersError extends HomeState {
  final String error;
  GetSlidersError({
    required this.error,
  });
}
class HomeState {}
class HomeInitialState extends HomeState {}
class GetCategoriesLoading extends HomeState {}

class GetCategoriesSuccess extends HomeState {}

class GetCategoriesError extends HomeState {
  final String error;
  GetCategoriesError({required this.error});
}
class ChangeCategoryState extends HomeState {}
class GetProductsLoading extends HomeState {}

class GetProductsSuccess extends HomeState {}

class GetProductsError extends HomeState {
  final String error;
  GetProductsError({required this.error});
}