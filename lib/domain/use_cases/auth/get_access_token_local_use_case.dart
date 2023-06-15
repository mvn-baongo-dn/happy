import '../../../injection/injector.dart';
import '../../repositories/auth_repository.dart';
import '../use_case.dart';

class GetAccessTokenLocalUseCase implements OutputUseCase<String?> {
  @override
  String? run() => injector.get<AuthRepository>().getAccessTokenFromLocal();
}
