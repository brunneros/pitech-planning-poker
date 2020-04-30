import 'package:flutter/material.dart';
import 'package:planningpoker/locator.dart';
import 'package:planningpoker/ui/cards_table.dart';
import 'package:planningpoker/ui/side_menu.dart';
import 'package:provider/provider.dart';

import 'core/viewmodels/deck_view_model.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DeckViewModel model = locator<DeckViewModel>();

  @override
  void initState() {
    model.getDecks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DeckViewModel>(
        create: (context) => model,
        child: Consumer<DeckViewModel>(
            builder: (context, model, child) => MaterialApp(
                title: 'PitechPlus Planning Poker',
                home: Scaffold(
                  appBar: AppBar(
                    title: Text('PitechPlus Planning Poker'),
                  ),
                  drawer: SideMenu(model),
                  body: CardsTable(model),
                ))));
  }
}
