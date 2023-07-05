import 'dart:convert';
import 'dart:ui';

import 'package:happy/data/models/app_settings/app_settings.dart';

import '../../domain/repositories/storage_repository.dart';
import '../../injection/injector.dart';
import '../../utilities/constants/key_constant.dart';
import '../data_sources/local/persistent_storage/persistent_storage.dart';

class StorageRepositoryImpl implements StorageRepository {
  StorageRepositoryImpl();

  final _preference = injector.get<PersistentStorage>();

  Future<void> _setAppSettings(AppSettings appSettings) async {
    final persistentStorage = _preference;
    final settingsString = jsonEncode(appSettings.toJson());
    return persistentStorage.setString(
      key: KeyConstants.keyAppSettings,
      value: settingsString,
    );
  }

  @override
  Future<AppSettings> getAppSettings() async {
    final persistentStorage = _preference;

    final settingsString = persistentStorage.getString(
      key: KeyConstants.keyAppSettings,
    );
    if (settingsString == null) {
      return const AppSettings();
    }
    final settingsJson = jsonDecode(settingsString) as Map<String, dynamic>;
    return AppSettings.fromJson(settingsJson);
  }

  @override
  Future<void> setHasOpenedOnboarding() async {
    final newAppSettings = (await getAppSettings()).copyWith(
      hasOpenedOnboarding: true,
    );
    return _setAppSettings(newAppSettings);
  }
    @override
  Future<void> setLanguage(Locale localeLanguage) async {
    final newAppSettings = (await getAppSettings()).copyWith(
     locale: localeLanguage.toString()
    );
    return _setAppSettings(newAppSettings);
  }

  @override
  String? getCharlesIp() {
    // TODO: implement getCharlesIp
    throw UnimplementedError();
  }

  @override
  bool getStatusTheme() {
    // TODO: implement getStatusTheme
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> setCharlesIp(String ip) {
    // TODO: implement setCharlesIp
    throw UnimplementedError();
  }

  @override
  Future<void> setFcmToken(String fcmToken) {
    // TODO: implement setFcmToken
    throw UnimplementedError();
  }

  @override
  Future<void> setStatusTheme(bool isDarkTheme) {
    // TODO: implement setStatusTheme
    throw UnimplementedError();
  }

  @override
  Future<void> setTokens({String? accessToken, String? refreshToken}) {
    // TODO: implement setTokens
    throw UnimplementedError();
  }
}
