import 'package:flutter/material.dart';
import 'package:planningpoker/core/models/deck.dart';
import "package:planningpoker/core/viewmodels/deck_view_model.dart";
import 'package:planningpoker/locator.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatefulWidget {
  final DeckViewModel model;
  SideMenu(this.model);

  @override
  State<StatefulWidget> createState() => SideMenuState(model);
}

class SideMenuState extends State<SideMenu> {
  DeckViewModel model;
  SideMenuState(this.model);

  @override
  Widget build(BuildContext context) {

    List<Widget> menuItemsList = [];

    // Menu header
    menuItemsList.add(DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Menu')));

    //add an entry for each deck available
    model.decks.forEach(
        (item) => menuItemsList.add(buildMenuItem(item, context, model)));

    // Settings entry
    menuItemsList.add(ListTile(
      leading: Icon(Icons.settings),
      title: Text('Settings'),
      onTap: () {
        Navigator.pop(context);
      },
    ));

    return Drawer(
        child: ListView(
      children: menuItemsList,
    ));
  }

  ListTile buildMenuItem(Deck deck, BuildContext context, DeckViewModel model) {

    Deck currentDeck = model.currentDeck;
    bool isCurrent = currentDeck?.title == deck.title;

    return ListTile(
      title: Text(
        deck.title,
        style: TextStyle(
            fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal),
      ),
      onTap: () {
        model.setCurrentDeck(deck);
        Navigator.pop(context);
      },
    );
  }
}
