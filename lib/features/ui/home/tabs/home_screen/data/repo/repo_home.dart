import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/network/api_categories_response.dart';
import 'package:shopping_app/core/network/api_helper.dart';
import 'package:shopping_app/core/network/api_response.dart';
import 'package:shopping_app/core/network/api_sliders_response.dart';
import 'package:shopping_app/core/network/end_point.dart';

class HomeRepo {

  HomeRepo._internal();
  static final HomeRepo _instance =
  HomeRepo._internal();
  factory HomeRepo() => _instance;
  final ApiHelper apiHelper = ApiHelper();
  Future<Either<String, List<Sliders>>> getSliders() async {
    try {
      ApiResponse apiResponse =
      await apiHelper.getRequest(
        endPoint: EndPoint.sliders,
        isAuthorization: false,
      );
      if (apiResponse.status) {
        List<Sliders> sliders =
        (apiResponse.data['sliders'] as List).map((e) =>
            Sliders.fromJson(e))
            .toList();
        return Right(sliders);
      }
      return Left(apiResponse.message);
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
  Future<Either<String, List<Categories>>> getCategories() async {
    try {
      ApiResponse apiResponse =
      await apiHelper.getRequest(
        endPoint: EndPoint.categories,
        isAuthorization:true,
      );
      if (apiResponse.status) {
        CategoriesModel model =
        CategoriesModel.fromJson(
          apiResponse.data,
        );
        return Right(
          model.categories ?? [],
        );
      }
      return Left(apiResponse.message);
    } catch (e) {
      return Left(
        ApiResponse.fromError(e).message,
      );
    }
  }
  Future<Either<String, List<Products>>> getProductsByCategory(int id) async {
    try {
      final response = await apiHelper.getRequest(
        endPoint: EndPoint.products,
        data: {
          "category_id": id,
        },
        isAuthorization: true,
      );

      if (response.status) {
        final products = (response.data['products'] as List)
            .map((e) => Products.fromJson(e))
            .toList();

        return Right(products);
      }

      return Left(response.message);
    } catch (e) {
      return Left(ApiResponse.fromError(e).message);
    }
  }
}