import 'dart:io';

import 'package:bus_schedule/core/const/core_constants.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Future<Dio> createHttpClient(
  String baseUrl, {
  bool useLogger = true,
}) async {
  final dio = Dio();
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = const Duration(seconds: 50);
  dio.options.receiveTimeout = const Duration(seconds: 30);

  if (kDebugMode && useLogger) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    );
  }

  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    return client;
  };

  return dio;
}

typedef ResponseJson<T> = T Function(Map<String, dynamic>);

/// вызов безопасно http функцию с обработкой пользовтелькой ошибки
/// [T] отвер сервера
Future<T> safeApiCall<T>(
  Future<Response> response,
  ResponseJson<T> jsonCall, {
  bool? isTest,
}) async {
  try {
    final result = await response;
    final json = result.data;
    return jsonCall.call(json);
  } catch (ex) {
    if (ex is DioError) {
      final data = ex.response?.data;
      throw HttpRequestException<String>(
        message: 'error message',
        httpTypeError: HttpTypeError.http,
        code: ex.response?.statusCode ?? 500,
      );
    }
    throw _throwDefaultError(ex);
  }
}

/// выкидывает исключение в виде ошибки по умалчанию
HttpRequestException<String> _throwDefaultError(exception) {
  return HttpRequestException<String>(
    message: exception,
    code: CoreConstants.zeroInt,
    httpTypeError: HttpTypeError.http,
  );
}

/// базовая обработка http ошибок
/// [message] тело ошибки
/// [code] http код ошибки
class HttpRequestException<T> implements Exception {
  int code;
  String? message;
  String? field;
  HttpTypeError? httpTypeError;

  factory HttpRequestException.fromJson(
    Map<String, dynamic> json,
  ) =>
      HttpRequestException(
        code: json['status_code'] as int,
        message: json['message'] as String?,
        field: json['details'] as String?,
      );

  HttpRequestException({
    required this.code,
    this.message,
    this.field,
    this.httpTypeError,
  });
}

enum HttpTypeError {
  unknown,
  notInternetConnection,
  http,
}
