import 'package:happy/domain/use_cases/auth/get_app_setting_use_case.dart';

import './locale_presenter.dart';
import '../../../../injection/injector.dart';

class LocaleModule {
  factory LocaleModule() => _instance;
  LocaleModule._internal();
  static final LocaleModule _instance = LocaleModule._internal();

  LocalePresenter register() {
    injector.registerLazySingleton<LocalePresenter>(
      () => LocalePresenter(injector.get<GetAppSettingUseCase>()),
    );
    return injector.get<LocalePresenter>();
  }

  void unRegister() {
    injector.unregister<LocalePresenter>();
  }
}
