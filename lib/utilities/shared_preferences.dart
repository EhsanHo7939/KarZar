import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static SharedPreferences? _preferences;
  static const _keyAccessToken = 'accessToken';
  static const _keyRefreshToken = 'refreshToken';

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setAccessToken(String accessToken) async =>
      await _preferences!.setString(_keyAccessToken, accessToken);

  static String? getAccessToken() => _preferences!.getString(_keyAccessToken);

  static Future setRefreshToken(String refreshToken) async =>
      await _preferences!.setString(_keyRefreshToken, refreshToken);

  static String? getRefreshToken() => _preferences!.getString(_keyRefreshToken);
}
