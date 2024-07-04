import 'package:dio/dio.dart';

class AuthPixInterceptor extends Interceptor {
  final dio = Dio();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return handler.next(options);
  }
}
