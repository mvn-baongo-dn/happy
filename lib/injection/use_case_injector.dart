import './injector.dart';
import '../domain/use_cases/auth/clear_auth_local_use_case.dart';
import '../domain/use_cases/auth/get_access_token_local_use_case.dart';
import '../domain/use_cases/auth/login_use_case.dart';
import '../domain/use_cases/auth/logout_use_case.dart';
import '../domain/use_cases/auth/save_access_token_local_use_case.dart';

class UseCaseInjector {
  static Future<void> register() async {
    injector.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(),
    );

    injector.registerLazySingleton<SaveAccessTokenLocalUseCase>(
      () => SaveAccessTokenLocalUseCase(),
    );

    injector.registerLazySingleton<GetAccessTokenLocalUseCase>(
      () => GetAccessTokenLocalUseCase(),
    );

    injector.registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(),
    );

    injector.registerLazySingleton<ClearAuthLocalUseCase>(
      () => ClearAuthLocalUseCase(),
    );
  }
}
