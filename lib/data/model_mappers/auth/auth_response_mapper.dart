import '../../../domain/entities/auth/auth_response_entity.dart';
import '../../models/auth/auth_response_model.dart';
import '../model_to_entity_mapper.dart';

class AuthResponseMapper
    implements ModelToEntityMapper<AuthResponseModel, AuthResponseEntity> {
  @override
  AuthResponseEntity map({required AuthResponseModel model}) =>
      AuthResponseEntity(
        email: model.email,
        accessToken: model.accessToken,
        refreshToken: model.refreshToken,
      );
}
