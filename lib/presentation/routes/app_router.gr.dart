// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.homeGuard,
  }) : super(navigatorKey);

  final HomeGuard homeGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    TodosWrapRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    ProfileWrapRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    UnknownRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const UnknownPage(),
      );
    },
    TodosRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const TodosPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        RouteConfig(
          HomeRoute.name,
          path: '/home',
          guards: [homeGuard],
          children: [
            RouteConfig(
              TodosWrapRoute.name,
              path: 'todos',
              parent: HomeRoute.name,
              children: [
                RouteConfig(
                  TodosRoute.name,
                  path: '',
                  parent: TodosWrapRoute.name,
                )
              ],
            ),
            RouteConfig(
              ProfileWrapRoute.name,
              path: 'profile',
              parent: HomeRoute.name,
              children: [
                RouteConfig(
                  ProfileRoute.name,
                  path: '',
                  parent: ProfileWrapRoute.name,
                )
              ],
            ),
            RouteConfig(
              UnknownRoute.name,
              path: '*',
              parent: HomeRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/home',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [EmptyRouterPage]
class TodosWrapRoute extends PageRouteInfo<void> {
  const TodosWrapRoute({List<PageRouteInfo>? children})
      : super(
          TodosWrapRoute.name,
          path: 'todos',
          initialChildren: children,
        );

  static const String name = 'TodosWrapRoute';
}

/// generated route for
/// [EmptyRouterPage]
class ProfileWrapRoute extends PageRouteInfo<void> {
  const ProfileWrapRoute({List<PageRouteInfo>? children})
      : super(
          ProfileWrapRoute.name,
          path: 'profile',
          initialChildren: children,
        );

  static const String name = 'ProfileWrapRoute';
}

/// generated route for
/// [UnknownPage]
class UnknownRoute extends PageRouteInfo<void> {
  const UnknownRoute()
      : super(
          UnknownRoute.name,
          path: '*',
        );

  static const String name = 'UnknownRoute';
}

/// generated route for
/// [TodosPage]
class TodosRoute extends PageRouteInfo<void> {
  const TodosRoute()
      : super(
          TodosRoute.name,
          path: '',
        );

  static const String name = 'TodosRoute';
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '',
        );

  static const String name = 'ProfileRoute';
}
