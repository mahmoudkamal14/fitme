import 'package:dio/dio.dart';
import 'package:fitme/core/networking/api_error_model.dart';

class ApiErrorHandler {
  static String handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else {
      return 'An unexpected error occurred';
    }
  }
  // Starfarag#11

  static String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Timeout error, please try again later';
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response!);
      case DioExceptionType.cancel:
        return 'Request was cancelled';
      case DioExceptionType.connectionError:
        return 'Connection error, please check your internet connection';
      case DioExceptionType.unknown:
        return 'An unknown error occurred, please try again later';
      case DioExceptionType.badCertificate:
        return 'Invalid SSL certificate';
    }
  }

  static String _handleBadResponse(Response response) {
    final apiError = ApiErrorModel.fromJson(response.data);

    return apiError.errorMessage;
  }
}
