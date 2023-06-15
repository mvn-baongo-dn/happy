import '../../../../data/models/account/login/login_request_model.dart';
import '../../../entities/account/login/login_request_entity.dart';
import '../../entity_to_model_mapper.dart';

class LoginRequestMapper
    implements EntityToModelMapper<LoginRequestEntity, LoginRequestModel> {
  @override
  LoginRequestModel map({required LoginRequestEntity entity}) =>
      LoginRequestModel(
        email: entity.email,
        password: entity.password,
      );
}
