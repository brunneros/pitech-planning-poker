import 'package:flutter/material.dart';
import 'package:planningpoker/core/viewmodels/settings_view_model.dart';
import 'package:planningpoker/locator.dart';
import 'package:planningpoker/main.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  SettingsViewModel model = locator<SettingsViewModel>();

  // get initial values for the preferences
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingsViewModel>(
      create: (context) => model,
      child: Consumer<SettingsViewModel>(
          builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text('PitechPlus Planning Poker'),
              // override default back functionality from app bar
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Main()),
                  );
                },
              ),
            ),
            body: SettingsList(
              sections: [
              SettingsSection(
                title: 'General settings',
                tiles: [
                  SettingsTile.switchTile(
                    title: 'Keep screen on',
                    leading: Icon(Icons.settings_power),
                    switchValue: model.keepScreenOn ?? false,
                    onToggle: (bool value) async {
                      model.setKeepScreenOn(value);
                    },
                  ),
                ],
              ),
            ],
          ))));
  }
}
