import 'package:happy/domain/repositories/storage_repository.dart';

import '../../../injection/injector.dart';
import '../use_case.dart';

class SetHasOpenedOnboardingUseCase implements FutureOutputUseCase<void> {
  @override
  Future<void> run() =>
      injector.get<StorageRepository>().setHasOpenedOnboarding();
}
