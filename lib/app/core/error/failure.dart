import 'package:dio/dio.dart';

abstract class Failure extends DioException {
  final String key;

  @override
  final String message;
  final int code;
  final Object? data;

  Failure({this.message = '', this.key = '', DioException? dioError, int? code, this.data})
      : code = code ?? 0,
        super(
          requestOptions: dioError?.requestOptions ?? RequestOptions(path: ''),
          response: dioError?.response,
          type: dioError?.type ?? DioExceptionType.unknown,
          error: dioError?.error,
        );
}

class UnhandledFailure extends Failure {
  UnhandledFailure({String? message, super.code, super.data})
      : super(message: message ?? 'Não foi possível concluir o processo. Verifique sua conexão e tente novamente!');
}
