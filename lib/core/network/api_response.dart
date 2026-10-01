import 'package:dio/dio.dart';

class ApiResponse {
  final bool status;
  final int statusCode;
  final dynamic data;
  final String message;

  ApiResponse({
    required this.status,
    required this.statusCode,
    this.data,
    required this.message,
  });

  factory ApiResponse.fromResponse(Response response) {
    return ApiResponse(
      status: response.data["status"] ?? false,
      statusCode: response.statusCode ?? 500,
      data: response.data,
      message: response.data['message'] ?? '',
    );
  }
  factory ApiResponse.fromError(dynamic error) {
    if (error is DioException) {
      return ApiResponse(
        status: false,
        data: error.response?.data,
        statusCode: error.response?.statusCode ?? 500,
        message: handleDioError(error),
      );
    } else {
      return ApiResponse(
        status: false,
        data: null,
        statusCode: 500,
        message: "Unexpected error occurred",
      );
    }
  }
  static String handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Connection timeout, please try again.";

      case DioExceptionType.sendTimeout:
        return "Send timeout, please check your internet.";

      case DioExceptionType.receiveTimeout:
        return "Receive timeout, please try again later.";

      case DioExceptionType.badResponse:
        return _handleServerError(error.response);

      case DioExceptionType.cancel:
        return "Request was cancelled.";

      case DioExceptionType.connectionError:
        return "No internet connection.";

      default:
        return "Unknown error occurred.";
    }
  }
  static String _handleServerError(Response? response) {
    if (response == null) {
      return "No response from server.";
    }
    final data = response.data;
    if (data is Map<String, dynamic>) {
      return data["message"] ?? "An error occurred.";
    }
    return "Unexpected server error.";
  }
}