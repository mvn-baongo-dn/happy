// ignore_for_file: inference_failure_on_untyped_parameter, strict_raw_type

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:happy/data/models/core/api_response_model.dart';
import 'package:happy/domain/repositories/auth_repository.dart';
import 'package:happy/injection/injector.dart';
import 'package:happy/presentation/routes/app_router.dart';
import 'package:happy/utilities/constants/api_constants.dart';
import 'package:happy/utilities/extensions/extensions.dart';
import 'package:happy/utilities/helpers/network_helper/network_helper.dart';

class AuthInterceptor extends QueuedInterceptorsWrapper {
  AuthInterceptor(
    this._dio,
  );

  final Dio _dio;

  final _context = injector.get<AppRouter>().navigatorKey.currentContext;

  /// Whether request requires authentication or not.
  bool isAuthenticatedPath(RequestOptions options) =>
      !ApiConstants.nonAuthenticatedPaths.contains(options.path);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (_context == null) {
      return;
    }
    final isConnected =
        await NetworkHelper.checkConnectivity(baseUrl: options.baseUrl);
    if (!isConnected) {
      handler.reject(
        DioError(
          requestOptions: options,
          error: '',
        ),
      );
      return;
    }

    injector
        .get<AuthRepository>()
        .getAccessTokenFromLocal()
        ?.safe((accessToken) {
      if (isAuthenticatedPath(options)) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    });

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (_isResponseNotFromServer(response)) {
      handler.reject(
        DioError(
          requestOptions: response.requestOptions,
          response: Response(
            statusCode: HttpStatus.misdirectedRequest,
            requestOptions: response.requestOptions,
          ),
        ),
      );
    }
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    if (_context == null) {
      return;
    }
    final requestOptions = err.requestOptions;

    if (isAuthenticatedPath(requestOptions)) {
      // Handle expired AccessToken
      final response = err.response;
      if (response != null && response.statusCode == HttpStatus.unauthorized) {
        if (_isForceLogout(response)) {
          await _logout();
          handler.next(err);
          return;
        }
        try {
          // Try get new AccessToken using refresh token
          final refreshedAccessToken = await _refreshAccessTokenIfNeeded(
            requestOptions,
          );

          // Retry the original request
          final retryRequest = await _retryRequest(
            refreshedAccessToken,
            requestOptions,
          );
          handler.resolve(retryRequest);
        } catch (_) {
          await _logout();
          handler.next(err);
        }
        return;
      }
    }
    if (err.type == DioErrorType.connectTimeout ||
        err.type == DioErrorType.receiveTimeout) {
      handler.next(
        DioError(
          requestOptions: requestOptions,
          error: '',
        ),
      );
      return;
    }
    final isConnected = await NetworkHelper.checkConnectivity(
      baseUrl: requestOptions.baseUrl,
    );
    if (!isConnected) {
      handler.next(
        DioError(
          requestOptions: err.requestOptions,
          error: '',
        ),
      );
      return;
    }
    if (_isResponseNotFromServer(err.response)) {
      handler.reject(
        DioError(
          requestOptions: err.requestOptions,
          response: Response(
            statusCode: HttpStatus.misdirectedRequest,
            requestOptions: err.requestOptions,
          ),
        ),
      );
      return;
    }
    handler.next(err);
  }

  Future<Response<dynamic>> _retryRequest(
    String refreshedAccessToken,
    RequestOptions requestOptions,
  ) {
    requestOptions.headers['Authorization'] = 'Bearer $refreshedAccessToken';

    _dio.options.baseUrl = requestOptions.baseUrl;
    _dio.options.connectTimeout = Duration.millisecondsPerSecond * 60;
    _dio.options.receiveTimeout = Duration.millisecondsPerSecond * 60;

    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      ),
    );
  }

  Future<String> _refreshAccessTokenIfNeeded(
    RequestOptions requestOptions,
  ) async {
    final authRepository = injector.get<AuthRepository>();
    final accessToken = authRepository.getAccessTokenFromLocal();

    if (accessToken == null) {
      throw Exception('');
    }

    final oldAccessToken = requestOptions.headers['Authorization'] as String;
    if (!oldAccessToken.contains(accessToken)) {
      return accessToken;
    }

    // TODO: Call api refresh token
    await authRepository.setAccessTokenToLocal('');
    await authRepository.setRefreshTokenToLocal('');
    return ''; // TODO: Return Access Token from api refresh token
  }

  Future<void> _logout() async {
    // TODO: Logic logout when response return status code: 401
  }

  /// [_isForceLogout] is true
  /// when the user is deleted, not the token is wrong or expired.
  /// Then we will logout without calling refresh token and retry request.
  bool _isForceLogout(response) {
    final dataError = ApiResponseModel.fromJson(
      response.data is String
          ? jsonDecode(response.data as String) as Map<String,dynamic>
          : response.data as Map<String, dynamic>,
      (p0) => null,
    );
    return dataError.forceLogout ?? false;
  }

  //// [_isResponseNotFromServer] will check if the response returned is from server api,
  //// if not from server api then we will return status code: 421 and show system error message
  //// because in fact there are some cases, the error returns from CDN, VPN but not from the backend server,
  //// the error returns status code: 200 but the response body is not in the correct format, leading to the wrong logic code.
  //// So we need to handle this case to group these special errors into a certain error message.
  //// If you want this functionality to work, then we need to ask the backend team to add the "x-api-response" param to the response headers,
  //// the above param needs to apply all the api that the app uses.
  ///
  ///// TODO: return below code to check CDN and VPN
  bool _isResponseNotFromServer(Response? response) => false;
  // !(response?.headers['x-api-response'].toString().contains('true') ??
  //     false);
}
