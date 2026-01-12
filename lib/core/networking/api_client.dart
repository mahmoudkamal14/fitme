import 'package:dio/dio.dart';
import 'package:fitme/core/cache/cache_helper.dart';
import 'package:fitme/core/cache/cache_helper_key.dart';
import 'package:fitme/core/routes/app_router.dart';
import 'package:fitme/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();

  static final Dio _dio = Dio();

  factory ApiClient() {
    return _instance;
  }

  Dio getDio() {
    Duration timeOut = const Duration(seconds: 60);
    _dio
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut;

    addPrettyDioLogger();
    ApiClient._internal();
    return _dio;
  }

  ApiClient._internal() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final accessToken = await CacheHelper().getSecuredData(
            key: CacheHelperKey.accessToken,
          );

          options.headers = {
            'Accept': 'application/json',
            'Authorization': 'Bearer $accessToken',
          };
          // لو مفيش FormData خليه JSON
          if (options.data is! FormData) {
            options.headers["Content-Type"] = "application/json";
          }
          //['Authorization'] = 'Bearer $accessToken';
          return handler.next(options);
        },
        onError: (error, handler) async {
          // التحقق من أن الخطأ هو 401 (Unauthenticated)
          if (error.response?.statusCode == 401) {
            // مسح بيانات المستخدم
            await CacheHelper().removeSecuredData(
              key: CacheHelperKey.accessToken,
            );
            await CacheHelper().saveData(
              key: CacheHelperKey.isLoggedIn,
              value: false,
            );

            // إعادة التوجيه إلى شاشة تسجيل الدخول
            AppRouter().onGenerateRoute(
              const RouteSettings(name: Routes.loginScreen),
            );
          }
          return handler.next(error);
        },
      ),
    );
  }

  static void addPrettyDioLogger() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
