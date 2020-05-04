import 'package:flutter/material.dart';
import 'package:planningpoker/ui/shared/pitech_colors.dart';
import 'package:planningpoker/ui/shared/pitech_theme.dart';
import 'package:provider/provider.dart';
import 'package:planningpoker/locator.dart';
import 'package:planningpoker/router.dart';
import 'package:planningpoker/ui/cards_table.dart';
import 'package:planningpoker/core/viewmodels/deck_view_model.dart';
import 'package:planningpoker/ui/side_menu.dart';

void main() {
  setupLocator();
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<Main> {

  DeckViewModel model = locator<DeckViewModel>();
  PitechTheme pitechTheme = PitechTheme();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DeckViewModel>(
        create: (context) => model,
        child: Consumer<DeckViewModel>(
            builder: (context, model, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: pitechTheme.themeData,
              title: 'PitechPlus Planning Poker',
                home: Scaffold(
                  appBar: AppBar(
                    title:  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(0, 80, 80, 80),
                        child: Image.asset("lib/assets/images/logo-large.png", fit: BoxFit.cover),
                      )
                    ),
                    backgroundColor: PitechColors.green1,
                  ),
                  drawer: SideMenu(model),
                  body: CardsTable(model),
                ),
                onGenerateRoute: Router.generateRoute,)));
  }
}
