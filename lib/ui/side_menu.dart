import 'package:flutter/material.dart';
import 'package:planningpoker/core/models/deck.dart';
import "package:planningpoker/core/viewmodels/deck_view_model.dart";

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
        decoration: BoxDecoration(color: Color.fromARGB(255, 51, 65, 76)),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset("lib/assets/images/logo-large.png", fit: BoxFit.cover),
        )));
    //add an entry for each deck available
    model.decks.forEach(
        (item) => menuItemsList.add(buildMenuItem(item, context, model)));

    // Settings entry
    menuItemsList.add(ListTile(
//      leading: Icon(Icons.settings),
      title: Text('Settings'),
      onTap: () {
        Navigator.pushNamed(context, 'settings');
      },
    ));

    return Drawer(
        child: Container(
            decoration: BoxDecoration(
//                color: Color.fromARGB(255, 57, 170, 169)
            color: Colors.white
            ),
            child: ListView(
      children: menuItemsList,
    )));
  }

  ListTile buildMenuItem(Deck deck, BuildContext context, DeckViewModel model) {
    Deck currentDeck = model.currentDeck;
    bool isCurrent = currentDeck?.title == deck.title;

    return ListTile(
      title: Text(
        deck.title,
        style: TextStyle(
          color: Colors.white,
            fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal),
      ),
//      leading: ConstrainedBox(
//        constraints: BoxConstraints(
////          minWidth: 44,
////          minHeight: 44,
//          maxWidth: 24,
//          maxHeight: 24,
//        ),
//        child: Image.asset(deck.icon, fit: BoxFit.cover),
//      ),
      onTap: () {
        model.setCurrentDeck(deck);
        Navigator.pop(context);
      },
    );
  }
}
