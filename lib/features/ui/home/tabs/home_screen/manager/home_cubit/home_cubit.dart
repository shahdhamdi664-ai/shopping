import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/ui/home/tabs/home_screen/data/repo/repo_home.dart';
import 'package:shopping_app/core/network/api_categories_response.dart';
import 'package:shopping_app/core/network/api_sliders_response.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo = HomeRepo();

  List<Sliders> sliders = [];
  List<Categories> categories = [];
  List<Products> products = [];
  int selectedCategoryId = 0;
  void changeCategory(int id) {
    selectedCategoryId = id;
    emit(ChangeCategoryState());
    getProductsByCategory(id);
  }
  Future<void> getSliders() async {
    emit(GetSlidersLoading());

    final response = await homeRepo.getSliders();

    response.fold(
          (error) {
        emit(GetSlidersError(error: error));
      },
          (data) {
        sliders = data;
        emit(GetSlidersSuccess());
      },
    );
  }

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());

    final response = await homeRepo.getCategories();

    response.fold(
          (error) {
        emit(GetCategoriesError(error: error));
      },
          (data) {
        categories = data;
        emit(GetCategoriesSuccess());
      },
    );
  }
  Future<void> getProductsByCategory(int id) async {
    emit(GetProductsLoading());

    final response = await homeRepo.getProductsByCategory(id);

    response.fold(
          (error) => emit(GetProductsError(error: error)),
          (data) {
        products = data;
        emit(GetProductsSuccess());
      },
    );
  }
}