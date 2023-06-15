import '../../../data/models/auth/auth_token_model.dart';
import '../../entities/auth/auth_token_entity.dart';
import '../entity_to_model_mapper.dart';

class AuthTokenEntityMapper
    implements EntityToModelMapper<AuthTokenEntity, AuthTokenModel> {
  @override
  AuthTokenModel map({required AuthTokenEntity entity}) => AuthTokenModel(
        accessToken: entity.accessToken,
        refreshToken: entity.refreshToken,
        tokenType: entity.tokenType,
        expiresIn: entity.expiresIn,
      );
}
