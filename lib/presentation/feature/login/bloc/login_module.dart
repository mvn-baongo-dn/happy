import './login_presenter.dart';
import '../../../../domain/use_cases/auth/login_use_case.dart';
import '../../../../domain/use_cases/auth/save_access_token_local_use_case.dart';
import '../../../../injection/injector.dart';
import '../../../core/base_page/base_bloc/base_module.dart';

class LoginModule extends BaseModule<LoginPresenter> {
  @override
  void register() {
    injector.registerFactory<LoginPresenter>(
      () => LoginPresenter(
        injector.get<SaveAccessTokenLocalUseCase>(),
        injector.get<LoginUseCase>(),
      ),
    );
  }
}
