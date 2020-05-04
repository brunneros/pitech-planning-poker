import 'package:get_it/get_it.dart';

import 'package:planningpoker/core/services/DeckService.dart';
import 'package:planningpoker/core/services/SettingsService.dart';
import 'package:planningpoker/core/viewmodels/deck_view_model.dart';
import 'package:planningpoker/core/viewmodels/settings_view_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => DeckViewModel());
  locator.registerFactory(() => SettingsViewModel());
  locator.registerLazySingleton(() => DeckService());
  locator.registerLazySingleton(() => SettingsService());
}