import 'package:shared_preferences/shared_preferences.dart';

import '../../local_storage/share_preference_key.dart';

abstract class PersistentStorageAbstract {}

class PersistentStorage implements PersistentStorageAbstract {
  PersistentStorage(this._preferences);

  final SharedPreferences _preferences;
  Future<bool> setRefreshToken(String token) => _preferences.setString(
        SharePreferenceKey.refreshToken,
        token,
      );

  Future<void> clearAllAuthData() async {
    await _preferences.remove(SharePreferenceKey.accessToken);
    await _preferences.remove(SharePreferenceKey.refreshToken);
  }

  String? getAccessToken() => _preferences.getString(
        SharePreferenceKey.accessToken,
      );

  String? getRefreshToken() => _preferences.getString(
        SharePreferenceKey.refreshToken,
      );

  Future<void> setString({required String key, required String value}) {
    return _preferences.setString(key, value);
  }

  String? getString({required String key}) {
    return _preferences.getString(key);
  }
}
