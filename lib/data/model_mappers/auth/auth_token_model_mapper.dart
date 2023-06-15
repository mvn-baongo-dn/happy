import '../../../domain/entities/auth/auth_token_entity.dart';
import '../../models/auth/auth_token_model.dart';
import '../model_to_entity_mapper.dart';

class AuthTokenModelMapper
    implements ModelToEntityMapper<AuthTokenModel, AuthTokenEntity> {
  @override
  AuthTokenEntity map({required AuthTokenModel model}) => AuthTokenEntity(
        accessToken: model.accessToken,
        refreshToken: model.refreshToken,
        tokenType: model.tokenType,
        expiresIn: model.expiresIn,
      );
}
