// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    ExplorationTourismDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ExplorationTourismDetailRouteArgs>(
          orElse: () => ExplorationTourismDetailRouteArgs(
              text: pathParams.getString('text')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ExplorationTourismDetailPage(
          text: args.text,
          key: args.key,
        ),
      );
    },
    FoodTourismRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FoodTourismPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    LanguageSelectionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LanguageSelectionPage(),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ExplorationTourismDetailPage]
class ExplorationTourismDetailRoute
    extends PageRouteInfo<ExplorationTourismDetailRouteArgs> {
  ExplorationTourismDetailRoute({
    required String text,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ExplorationTourismDetailRoute.name,
          args: ExplorationTourismDetailRouteArgs(
            text: text,
            key: key,
          ),
          rawPathParams: {'text': text},
          initialChildren: children,
        );

  static const String name = 'ExplorationTourismDetailRoute';

  static const PageInfo<ExplorationTourismDetailRouteArgs> page =
      PageInfo<ExplorationTourismDetailRouteArgs>(name);
}

class ExplorationTourismDetailRouteArgs {
  const ExplorationTourismDetailRouteArgs({
    required this.text,
    this.key,
  });

  final String text;

  final Key? key;

  @override
  String toString() {
    return 'ExplorationTourismDetailRouteArgs{text: $text, key: $key}';
  }
}

/// generated route for
/// [FoodTourismPage]
class FoodTourismRoute extends PageRouteInfo<void> {
  const FoodTourismRoute({List<PageRouteInfo>? children})
      : super(
          FoodTourismRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoodTourismRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LanguageSelectionPage]
class LanguageSelectionRoute extends PageRouteInfo<void> {
  const LanguageSelectionRoute({List<PageRouteInfo>? children})
      : super(
          LanguageSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageSelectionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
