import '../entities/account/login/login_request_entity.dart';
import '../entities/account/login/login_response_entity.dart';
import '../entities/core/api_response.dart';

abstract class AuthRepository {
  Future<ApiResponse<LoginResponseEntity>> login(
    LoginRequestEntity loginRequest,
  );

  Future<ApiResponse> logout();

  Future<bool> setAccessTokenToLocal(String token);

  Future<bool> setRefreshTokenToLocal(String token);

  Future<void> clearAllAuthLocalData();

  String? getAccessTokenFromLocal();

  String? getRefreshTokenFromLocal();
}
