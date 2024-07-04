import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wecan/app/core/rest/rest_client_response.dart';
import 'package:dio/dio.dart';

import '../rest_client.dart';

class DioRestClient implements RestClient {
  late final Dio _dio;
  final _defaultOptions = BaseOptions(
    connectTimeout: const Duration(seconds: 45),
    receiveTimeout: const Duration(seconds: 45),
    sendTimeout: const Duration(seconds: 45),
    headers: {
      HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
    },
  );

  DioRestClient({BaseOptions? baseOptions}) {
    _dio = Dio(baseOptions ?? _defaultOptions);
    _dio.interceptors.addAll([
      if (kDebugMode)
        PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
          error: false,
          compact: false,
        ),
    ]);
  }

  @override
  Future<RestClientResponse<T>> delete<T>(String path,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.delete(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter(response);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<RestClientResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter(response);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<RestClientResponse<T>> post<T>(String path,
      {Map<String, dynamic>? queryParameters, body, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter(response);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<RestClientResponse<T>> put<T>(String path,
      {Map<String, dynamic>? queryParameters, body, Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.put(
        path,
        queryParameters: queryParameters,
        data: body,
        options: Options(
          headers: headers,
        ),
      );
      return _dioResponseConverter(response);
    } on DioException {
      rethrow;
    }
  }

  @override
  RestClient auth() {
    _defaultOptions.extra['auth_required'] = true;
    return this;
  }

  @override
  RestClient unauth() {
    _defaultOptions.extra['auth_required'] = false;
    return this;
  }

  Future<RestClientResponse<T>> _dioResponseConverter<T>(Response<dynamic> response) async {
    return RestClientResponse<T>(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
    );
  }
}
