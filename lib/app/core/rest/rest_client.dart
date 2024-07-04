import 'package:wecan/app/core/rest/rest_client_response.dart';

abstract class RestClient {
  RestClient auth();
  RestClient unauth();

  Future<RestClientResponse<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers});

  Future<RestClientResponse<T>> post<T>(String path,
      {Map<String, dynamic>? queryParameters, dynamic body, Map<String, dynamic>? headers});

  Future<RestClientResponse<T>> put<T>(String path,
      {Map<String, dynamic>? queryParameters, dynamic body, Map<String, dynamic>? headers});

  Future<RestClientResponse<T>> delete<T>(String path,
      {Map<String, dynamic>? queryParameters, Map<String, dynamic>? headers});
}
