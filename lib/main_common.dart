import 'package:flutter/material.dart';
import 'package:happy/injection/dependency_manager.dart';
import 'package:happy/presentation/app.dart';
import 'package:happy/utilities/helpers/app_helper/app_flavor_helper.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> mainCommon(AppFlavor flavor) async {
  // NOTE: This is required for accessing the method channel before runApp().
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyManager.inject(flavor);
  // Remove hashtag url flutter web
  setPathUrlStrategy();
  runApp(const App());
}
