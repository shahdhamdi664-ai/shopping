import 'package:dio/dio.dart';
import 'package:shopping_app/core/database/data_base.dart';
import 'package:shopping_app/core/network/end_point.dart';

import 'api_response.dart';

class ApiHelper{
  static final ApiHelper _apiHelper =ApiHelper._internal();
  factory ApiHelper(){
    return _apiHelper;
  }
  ApiHelper._internal();
  Dio dio=Dio(
      BaseOptions(
          baseUrl:EndPoint.baseUrl ,
          connectTimeout: Duration(seconds: 15),
          sendTimeout: Duration(seconds: 15),
          receiveTimeout: Duration(seconds: 15)

      )
  );
  Future<ApiResponse> getRequest({
    required String endPoint,
    Map<String,dynamic>? data,
    bool isFormData=true,
    bool isAuthorization=true
  })async{
    try{
      var response= await dio.get(
          endPoint,
          data:isFormData? FormData.fromMap(data??{}):data,
          options: Options(
              headers: {
                if(isAuthorization)
                  'Authorization':'Bearer ${DataBase.accessToken}'
              }
          ));
      return ApiResponse.fromResponse(response);
    }catch(e){
      return ApiResponse.fromError(e);
    }
  }
  Future<ApiResponse> postRequest({
    required String endPoint,
    Map<String,dynamic>? data,
    bool isFormData=true,
    bool isAuthorization=true
  })async{
    try{
      var response= await dio.post(
          endPoint,
          data:isFormData? FormData.fromMap(data??{}):data,
          options: Options(
              headers: {
                if(isAuthorization)
                  'Authorization':'Bearer ${DataBase.accessToken}'
              }
          ));
      return ApiResponse.fromResponse(response);
    }catch(e){
      return ApiResponse.fromError(e);
    }
  }
  Future<ApiResponse> putRequest({
    required String endPoint,
    Map<String,dynamic>? data,
    bool isFormData=true,
    bool isAuthorization=true
  })async{
    try{
      var response= await dio.put(
          endPoint,
          data:isFormData? FormData.fromMap(data??{}):data,
          options: Options(
              headers: {
                if(isAuthorization)
                  'Authorization':'Bearer ${DataBase.accessToken}'
              }
          ));
      return ApiResponse.fromResponse(response);
    }catch(e){
      return ApiResponse.fromError(e);
    }
  }
  Future<ApiResponse> deleteRequest({
    required String endPoint,
    Map<String,dynamic>? data,
    bool isFormData=true,
    bool isAuthorization=true
  })async{
    try{
      var response= await dio.delete(
          endPoint,
          data:isFormData? FormData.fromMap(data??{}):data,
          options: Options(
              headers: {
                if(isAuthorization)
                  'Authorization':'Bearer ${DataBase.accessToken}'
              }
          ));
      return ApiResponse.fromResponse(response);
    }catch(e){
      return ApiResponse.fromError(e);
    }
  }
}