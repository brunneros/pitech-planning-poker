import 'package:flutter/foundation.dart';
import 'package:planningpoker/core/services/SettingsService.dart';
import 'package:planningpoker/locator.dart';

class SettingsViewModel extends ChangeNotifier {

  final SettingsService settingsService = locator<SettingsService>();
  bool keepScreenOn;

  getKeepScreenOn() async {
    keepScreenOn = await settingsService.getKeepScreenOn();
    notifyListeners();
  }

  setKeepScreenOn(bool value) async {
    keepScreenOn = await settingsService.setKeepScreenOn(value);
    notifyListeners();
  }

  // get settings in constructor, to replace getting them in initState()
  SettingsViewModel() {
    getKeepScreenOn();
  }
}