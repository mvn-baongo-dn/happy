// ignore_for_file: strict_raw_type

import 'package:dio/dio.dart' hide Headers;
import 'package:happy/data/models/account/login/login_request_model.dart';
import 'package:happy/data/models/account/login/login_response_model.dart';
import 'package:happy/data/models/core/api_response_model.dart';
import 'package:happy/utilities/constants/api_constants.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST(ApiConstants.login)
  Future<ApiResponseModel<LoginResponseModel>> login(
    @Body() LoginRequestModel loginRequestModel,
  );

  @POST(ApiConstants.logout)
  Future<ApiResponseModel> logout();
}
