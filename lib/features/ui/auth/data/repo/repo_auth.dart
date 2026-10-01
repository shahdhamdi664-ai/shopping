import 'package:dartz/dartz.dart';

import 'package:shopping_app/core/network/api_helper.dart';
import 'package:shopping_app/core/network/api_response.dart';
import 'package:shopping_app/core/network/end_point.dart';
import 'package:shopping_app/features/ui/auth/data/models/login_model.dart';
import '../../../../../core/database/data_base.dart';



class AuthRepo{
  AuthRepo._internal();
  static final AuthRepo _instance=AuthRepo._internal();
  factory AuthRepo()=> _instance;
  ApiHelper apiHelper=ApiHelper();
  Future<Either<String,String>> register({
    required String name,
    required String password,
    required String email,
    required String phone
  })async{
    try{

      ApiResponse apiResponse=await apiHelper.postRequest(
        endPoint: EndPoint.register,
        data:{
          'name':name,
          "phone":phone,
          "email":email,
          "password":password,
        },
        isAuthorization: false,
      );
      if(apiResponse.status){
        return Right(apiResponse.message);
      }
      return Left(apiResponse.message);
    }catch(e){
      return Left(ApiResponse.fromError(e).message);

    }

  }
  Future<Either<String,LoginResModel>>login ({required String email,required String password})async{
    try{

      ApiResponse apiResponse=await apiHelper.postRequest(
        endPoint: EndPoint.login,
        data:{
          "email":email,
          "password":password,
        },
        isAuthorization: false,
      );
      if(apiResponse.status){
        LoginResModel loginModel=LoginResModel.fromJson(apiResponse.data);
        if(loginModel.user==null){
          return Left(apiResponse.message);
        }
        DataBase.accessToken=loginModel.accessToken;
        DataBase.refreshToken=loginModel.refreshToken;
        return Right(loginModel);
      }
      return Left(apiResponse.message);

    }catch(e){
      return Left(e.toString());
    }

  }
}