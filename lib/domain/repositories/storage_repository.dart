// import './movies_type.dart';
// import '../../model/app_auth/app_auth.dart';
// import '../../model/app_settings/app_settings.dart';
// import '../../model/movie/movie.dart';

import 'dart:ui';

import '../../data/models/app_settings/app_settings.dart';

abstract class StorageRepository {
  Future<void> logout();
  // Future<void> changeMovie(Movie movie, MoviesType moviesType);
  Future<AppSettings> getAppSettings();
  Future<void> setHasOpenedOnboarding();
  Future<void> setLanguage(Locale locale);
  // Future<AppAuth> getAppAuth();
  // Future<List<Movie>> getMovies(MoviesType moviesType);
  Future<void> setFcmToken(String fcmToken);
  Future<void> setTokens({String? accessToken, String? refreshToken});
  Future<void> setStatusTheme(bool isDarkTheme);
  bool getStatusTheme();
  Future<void> setCharlesIp(String ip);
  String? getCharlesIp();
}
