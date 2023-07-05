import '../../../injection/injector.dart';
import '../../entities/account/login/login_request_entity.dart';
import '../../entities/auth/auth_response_entity.dart';
import '../../entities/core/api_response.dart';
import '../../repositories/auth_repository.dart';
import '../use_case.dart';

class LoginUseCase
    implements
        FutureUseCase<LoginRequestEntity, ApiResponse<AuthResponseEntity>> {
  @override
  Future<ApiResponse<AuthResponseEntity>> run(input) =>
      injector.get<AuthRepository>().login(input);
}
