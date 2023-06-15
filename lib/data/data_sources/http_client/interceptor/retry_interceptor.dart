// ignore_for_file: strict_raw_type

import 'dart:io';

import 'package:dio/dio.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  RetryOnConnectionChangeInterceptor({
    required this.dio,
  });
  final Dio dio;

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_shouldRetryOnHttpException(err)) {
      try {
        handler.resolve(await _requestRetry(err.requestOptions));
      } on DioError catch (errRetry) {
        handler.next(errRetry);
      }
      return;
    }
    handler.next(err);
  }

  bool _shouldRetryOnHttpException(DioError err) =>
      err.type == DioErrorType.other &&
      (err.error is HttpException && err.message.contains('') ||
          err.message.contains(''));

  Future<Response> _requestRetry(RequestOptions requestOptions) async =>
      dio.request(
        requestOptions.baseUrl + requestOptions.path,
        cancelToken: requestOptions.cancelToken,
        data: requestOptions.data,
        onReceiveProgress: requestOptions.onReceiveProgress,
        onSendProgress: requestOptions.onSendProgress,
        queryParameters: requestOptions.queryParameters,
        options: Options(
          contentType: requestOptions.contentType,
          headers: requestOptions.headers,
          sendTimeout: requestOptions.sendTimeout,
          receiveTimeout: requestOptions.receiveTimeout,
          extra: requestOptions.extra,
          followRedirects: requestOptions.followRedirects,
          listFormat: requestOptions.listFormat,
          maxRedirects: requestOptions.maxRedirects,
          method: requestOptions.method,
          receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
          requestEncoder: requestOptions.requestEncoder,
          responseDecoder: requestOptions.responseDecoder,
          responseType: requestOptions.responseType,
          validateStatus: requestOptions.validateStatus,
        ),
      );
}
