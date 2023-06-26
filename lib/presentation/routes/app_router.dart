import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import './router_path.dart';
import '../../injection/injector.dart';
import '../../presentation/feature/home/home_page.dart';
import '../../presentation/feature/login/login_page.dart';
import '../../presentation/feature/splash/splash_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: RouterPathConstants.home,
      page: HomePage,
      initial: true,
    ),
    AutoRoute(
      path: '/splash',
      page: SplashPage,
    ),
    AutoRoute(
      path: RouterPathConstants.login,
      page: LoginPage,
    ),
  ],
)
// Extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
  }) : super();

  static BuildContext get context =>
      // ignore: force_null_safety
      injector.get<AppRouter>().navigatorKey.currentContext!;
}
