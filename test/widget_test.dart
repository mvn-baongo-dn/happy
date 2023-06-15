// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_template/injection/injector.dart';
// import 'package:flutter_template/presentation/core/locale/support_locale.dart';
// import 'package:flutter_template/presentation/routes/app_router.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'injection/mock_app_modules.dart';
// import 'injection/mock_splash_module.dart';

void main() {
  // setUpAll(() async {
  //   injector.allowReassignment = true;
  //   await MockAppModules.inject();
  //   await MockSplashModule.inject();
  // });

  // testWidgets('App test', (tester) async {
  //   await tester.pumpWidget(AppWrapper());

  //   expect(
  //     find.byWidgetPredicate((widget) => widget is MaterialApp),
  //     findsOneWidget,
  //   );

  //   tester.binding.handleAppLifecycleStateChanged
  //   (AppLifecycleState.inactive);
  // });

  // tearDownAll(() {
  //   injector.allowReassignment = false;
  // });
}

// class AppWrapper extends StatelessWidget {
//   AppWrapper({Key? key}) : super(key: key);

//   final _appRouter = injector.get<AppRouter>();

//   @override
//   Widget build(BuildContext context) => MaterialApp.router(
//         routerDelegate: _appRouter.delegate(),
//         locale: L10n.defaultLocal,
//         localizationsDelegates: const [
//           AppLocalizations.delegate,
//           GlobalMaterialLocalizations.delegate,
//           GlobalWidgetsLocalizations.delegate,
//           GlobalCupertinoLocalizations.delegate,
//         ],
//         supportedLocales: L10n.support,
//         routeInformationParser: _appRouter.defaultRouteParser(),
//       );
// }
