import 'package:happy/domain/entities/account/refresh_token_request/refresh_token_request_entity.dart';
import 'package:happy/domain/entity_mappers/accounts/refesh_token/refresh_token_request_mapper.dart';

import '../../domain/entities/account/login/login_request_entity.dart';
import '../../domain/entities/auth/auth_response_entity.dart';
import '../../domain/entities/core/api_response.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../injection/injector.dart';
import '../data_sources/http_client/api_client.dart';
import '../data_sources/local/persistent_storage/share_preference_data_source.dart';
import '../model_mappers/auth/auth_response_mapper.dart';
import '../model_mappers/core/api_response_mapper.dart';
import '../models/auth/auth_response_model.dart';
import '../models/core/api_response_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  final _apiClient = injector.get<ApiClient>();
  final _preference = injector.get<SharePreferenceDataSource>();

  @override
  Future<ApiResponse<AuthResponseEntity>> login(
    LoginRequestEntity loginRequest,
  ) async {
    // final response = await _apiClient.login(
    //   LoginRequestMapper().map(entity: loginRequest),
    // );
    //TO DO
    final responses = ApiResponseModel(
      data: AuthResponseModel(
        email: 'bao@gmail.com',
        accessToken: 'abcd',
        refreshToken: 'abcd',
      ),
    );
    return ApiResponseMapper(
      mapperData: AuthResponseMapper(),
    ).map(model: responses);
  }

  @override
  Future<ApiResponse> logout() async {
    final response = await _apiClient.logout();
    return ApiResponseMapper().map(model: response);
  }

  @override
  Future<void> clearAllAuthLocalData() => _preference.clearAllAuthData();

  @override
  String? getAccessTokenFromLocal() => _preference.getAccessToken();

  @override
  String? getRefreshTokenFromLocal() => _preference.getRefreshToken();

  @override
  Future<bool> setAccessTokenToLocal(String token) =>
      _preference.setAccessToken(token);

  @override
  Future<bool> setRefreshTokenToLocal(String token) =>
      _preference.setRefreshToken(token);

  @override
  Future<ApiResponse<AuthResponseEntity>> refreshToken(
    RefreshTokenRequestEntity email,
  ) async {
    final response = await _apiClient.refreshToken(
      RefreshTokenRequestMapper().map(entity: email),
    );
    return ApiResponseMapper(
      mapperData: AuthResponseMapper(),
    ).map(model: response);
  }
}
