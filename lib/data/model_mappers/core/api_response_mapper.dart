import 'package:happy/data/model_mappers/model_to_entity_mapper.dart';
import 'package:happy/data/models/core/api_response_model.dart';
import 'package:happy/domain/entities/core/api_response.dart';

// ignore: strict_raw_type
class ApiResponseMapper<M extends ModelToEntityMapper> {
  ApiResponseMapper({this.mapperData});
  final M? mapperData;

  ApiResponse<E> map<E>({
    // ignore: strict_raw_type
    required ApiResponseModel model,
  }) =>
      ApiResponse(
        success: model.success,
        message: model.message,
        error: model.error,
        forceLogout: model.forceLogout,
        data: mapperData?.map(model: model.data) as E,
      );
}
