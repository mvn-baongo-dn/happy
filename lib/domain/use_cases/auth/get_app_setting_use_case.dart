import 'package:happy/data/models/app_settings/app_settings.dart';
import 'package:happy/domain/repositories/storage_repository.dart';

import '../../../injection/injector.dart';
import '../use_case.dart';

class GetAppSettingUseCase implements FutureOutputUseCase<AppSettings> {
  @override
  Future<AppSettings> run() =>
      injector.get<StorageRepository>().getAppSettings();
}
