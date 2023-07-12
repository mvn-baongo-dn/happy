import 'dart:ui';

import 'package:happy/domain/repositories/storage_repository.dart';

import '../../../injection/injector.dart';
import '../use_case.dart';

class SetLanguageUseCase implements FutureUseCase<Locale, void> {
  @override
  Future<void> run(input) =>
      injector.get<StorageRepository>().setLanguage(input);
}
