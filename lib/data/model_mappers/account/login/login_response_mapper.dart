import '../../../../domain/entities/account/login/login_response_entity.dart';
import '../../../models/account/login/login_response_model.dart';
import '../../model_to_entity_mapper.dart';

class LoginResponseMapper
    implements ModelToEntityMapper<LoginResponseModel, LoginResponseEntity> {
  @override
  LoginResponseEntity map({required LoginResponseModel model}) =>
      LoginResponseEntity(
        email: model.email,
        accessToken: model.accessToken,
        refreshToken: model.refreshToken,
      );
}
