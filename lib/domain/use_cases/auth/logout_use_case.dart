import '../../../injection/injector.dart';
import '../../entities/core/api_response.dart';
import '../../repositories/auth_repository.dart';
import '../use_case.dart';

class LogoutUseCase implements FutureOutputUseCase<ApiResponse> {
  @override
  Future<ApiResponse> run() => injector.get<AuthRepository>().logout();
}
