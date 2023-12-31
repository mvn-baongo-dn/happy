import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:happy/presentation/routes/router_path.dart';

import '../feature/exploration_tourism_detail/exploration_tourism_detail_page.dart';
import '../feature/food_tourism/food_tourism_page.dart';
import '../../injection/injector.dart';
import '../../presentation/feature/home/home_page.dart';
import '../../presentation/feature/login/login_page.dart';
import '../../presentation/feature/splash/splash_page.dart';
import '../feature/language_selection/language_selection_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: RouterPathConstants.splash,
          page: SplashRoute.page,
        ),
        AutoRoute(
          path: RouterPathConstants.login,
          page: LoginRoute.page,
        ),
        AutoRoute(
          path: RouterPathConstants.home,
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: FoodTourismRoute.page,
        ),
        AutoRoute(
          page: LanguageSelectionRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: ExplorationTourismDetailRoute.page,
        ),
      ];
  static BuildContext get context =>
      // ignore: force_null_safety
      injector.get<AppRouter>().navigatorKey.currentContext!;
}
