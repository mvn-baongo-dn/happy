import 'package:auto_route/auto_route.dart';

import '../../../domain/use_cases/auth/get_access_token_local_use_case.dart';
import '../../../injection/injector.dart';
import '../app_router.dart';

class HomeGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final token = injector.get<GetAccessTokenLocalUseCase>().run();
    if (token == null) {
      router.replace(const LoginRoute());
    } else {
      resolver.next(true);
    }
  }
}
