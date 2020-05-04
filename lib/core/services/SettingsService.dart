import 'package:shared_preferences/shared_preferences.dart';

class SettingsService {

  final String _keepScreenOn = 'keepScreenOn';

  Future<bool> getKeepScreenOn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keepScreenOn) ?? false;
  }

  Future<bool> setKeepScreenOn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_keepScreenOn, value);
  }
}