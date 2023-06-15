import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:flutter/material.dart';

import './guards/home_guard.dart';
import './router_path.dart';
import '../../injection/injector.dart';
import '../../presentation/feature/home/home_page.dart';
import '../../presentation/feature/login/login_page.dart';
import '../../presentation/feature/splash/splash_page.dart';
import '../../presentation/feature/unknown_page/unknown_page.dart';
import '../feature/profile/profile_page.dart';
import '../feature/todos/todos_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: RouterPathConstants.splash,
      page: SplashPage,
      initial: true,
    ),
    AutoRoute(
      path: RouterPathConstants.login,
      page: LoginPage,
    ),
    AutoRoute(
      path: RouterPathConstants.home,
      page: HomePage,
      guards: [HomeGuard],
      children: [
        AutoRoute(
          path: RouterPathConstants.todos,
          name: 'TodosWrapRoute',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: TodosPage,
            ),
          ],
        ),
        AutoRoute(
          path: RouterPathConstants.profile,
          name: 'ProfileWrapRoute',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: ProfilePage,
            ),
          ],
        ),
        AutoRoute(
          path: '*',
          page: UnknownPage,
        ),
      ],
    ),
  ],
)
// Extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({
    required HomeGuard homeGuard,
    GlobalKey<NavigatorState>? navigatorKey,
  }) : super(navigatorKey: navigatorKey, homeGuard: homeGuard);

  static BuildContext get context =>
      // ignore: force_null_safety
      injector.get<AppRouter>().navigatorKey.currentContext!;
}
