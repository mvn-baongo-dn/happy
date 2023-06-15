import './splash_presenter.dart';
import '../../../../domain/use_cases/auth/get_access_token_local_use_case.dart';
import '../../../../injection/injector.dart';
import '../../../core/base_page/base_bloc/base_module.dart';

class SplashModule extends BaseModule {
  @override
  void register() {
    injector.registerFactory<SplashPresenter>(
      () => SplashPresenter(injector.get<GetAccessTokenLocalUseCase>()),
    );
  }
}
