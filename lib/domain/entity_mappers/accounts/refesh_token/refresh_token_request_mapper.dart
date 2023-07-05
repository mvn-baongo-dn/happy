import 'package:happy/domain/entities/account/refresh_token_request/refresh_token_request_entity.dart';

import '../../../../data/models/account/refresh_token_request/refresh_token_request_model.dart';
import '../../entity_to_model_mapper.dart';

class RefreshTokenRequestMapper
    implements
        EntityToModelMapper<RefreshTokenRequestEntity,
            RefreshTokenRequestModel> {
  @override
  RefreshTokenRequestModel map({required RefreshTokenRequestEntity entity}) =>
      RefreshTokenRequestModel(
        email: entity.email,
      );
}
