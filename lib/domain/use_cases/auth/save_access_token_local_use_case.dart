import '../../../injection/injector.dart';
import '../../repositories/auth_repository.dart';
import '../use_case.dart';

class SaveAccessTokenLocalUseCase implements FutureUseCase<String, void> {
  @override
  Future<void> run(input) =>
      injector.get<AuthRepository>().setAccessTokenToLocal(input);
}
