import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './injector.dart';
import '../data/data_sources/http_client/api_client.dart';
import '../data/data_sources/http_client/interceptor/auth_interceptor.dart';
import '../data/data_sources/http_client/interceptor/logger_interceptor.dart';
import '../data/data_sources/http_client/interceptor/retry_interceptor.dart';
import '../data/data_sources/local_storage/share_preference_data_source.dart';
import '../presentation/core/app_lifecycle/app_lifecycle.dart';
import '../presentation/routes/app_router.dart';
import '../utilities/helpers/app_helper/app_flavor_helper.dart';
import '../utilities/helpers/logger_helper/logger.dart';

class ServiceInjector {
  static Future<void> register() async {
    LoggerHelper.setEnableLogger(injector.get<AppFlavor>().isDevelopment);

    // Share Preferences
    final sharedPreferences = await SharedPreferences.getInstance();

    injector.registerLazySingleton<SharePreferenceDataSource>(
      () => SharePreferenceDataSource(sharedPreferences),
    );

    // Http Client
    injector.registerLazySingleton<Dio>(() {
      final dio = Dio();
      dio.options.baseUrl = injector.get<AppFlavor>().apiBaseUrl;
      dio.interceptors.addAll([
        AuthInterceptor(dio),
        RetryOnConnectionChangeInterceptor(dio: dio),
        if (injector.get<AppFlavor>().isDevelopment) LoggerInterceptor(),
      ]);
      return dio;
    });

    injector.registerLazySingleton<ApiClient>(
      () => ApiClient(
        injector.get<Dio>(),
        baseUrl: injector.get<AppFlavor>().apiBaseUrl,
      ),
    );

    // Router
    injector.registerLazySingleton<AppRouter>(
      () => AppRouter(),
    );

    // AppLifecycle
    injector.registerLazySingleton<AppLifecycle>(
      () => AppLifecycle(),
    );
  }
}
