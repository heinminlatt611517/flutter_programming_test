import 'package:get_storage/get_storage.dart';

const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";

class AppPreference {
  final GetStorage _sharedPreferences;

  AppPreference(this._sharedPreferences);

  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.write(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIN() async {
    return _sharedPreferences.read(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
  }
}
