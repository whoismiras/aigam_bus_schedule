import 'package:dio/dio.dart';

class HttpClient {
  HttpClient({required baseUrl}) {
    initHttp(baseUrl);
  }

  Future<Dio> initHttp(baseUrl) async {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
    );
    _dio = Dio(options);
    _dio.options.connectTimeout = const Duration(seconds: 50);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    return _dio;
  }

  late Dio _dio;

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future post(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.post(
      path,
      data: data,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future put(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.put(
      path,
      data: data,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future patch(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.patch(
      path,
      data: data,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future delete(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.delete(
      path,
      data: data,
      options: options,
      cancelToken: cancelToken,
    );
  }
}

Future<Dio> initHttp(baseUrl) async {
  late final Dio _dio;
  final BaseOptions options = BaseOptions(
    baseUrl: baseUrl,
  );

  _dio = Dio(options);
  _dio.options.connectTimeout = const Duration(seconds: 50);
  _dio.options.receiveTimeout = const Duration(seconds: 30);
  return _dio;
}
