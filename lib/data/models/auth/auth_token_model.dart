import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_token_model.freezed.dart';

@freezed
class AuthTokenModel with _$AuthTokenModel {
  const factory AuthTokenModel({
    required String accessToken,
    required String refreshToken,
    required String tokenType,
    required double expiresIn,
  }) = _AuthTokenModel;

  const AuthTokenModel._();
}
