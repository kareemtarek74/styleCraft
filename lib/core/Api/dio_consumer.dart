import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:style_craft/core/Api/api_consumer.dart';
import 'package:style_craft/core/Api/api_interceptors.dart';
import 'package:style_craft/core/Errors/exceptions.dart';
import 'package:style_craft/core/services/get_it_service.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({
    required this.dio,
  }) {
    dio.options.connectTimeout = const Duration(seconds: 180);
    dio.options.receiveTimeout = const Duration(seconds: 180);
    dio.options.sendTimeout = const Duration(seconds: 180);

    dio.interceptors.add(getIt<ApiInterceptors>());
    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );
    }
  }

  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.delete(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future put(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.put(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.post(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
      debugPrint('DioException: ${e.message}');
      debugPrint('Error Details: ${e.response?.data}');
    }
  }
}
