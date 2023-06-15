import '../../../injection/injector.dart';
import '../../repositories/auth_repository.dart';
import '../use_case.dart';

class ClearAuthLocalUseCase implements FutureOutputUseCase<void> {
  @override
  Future<void> run() => injector.get<AuthRepository>().clearAllAuthLocalData();
}
