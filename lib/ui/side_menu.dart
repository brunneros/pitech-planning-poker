import 'package:flutter/material.dart';
import 'package:planningpoker/core/models/deck.dart';
import "package:planningpoker/core/viewmodels/deck_view_model.dart";
import 'package:planningpoker/ui/shared/pitech_colors.dart';

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
        decoration: BoxDecoration(color: PitechColors.green1),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text('PLANNING POKER',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: PitechColors.green4,
                  fontSize: 40)),
        )));

    menuItemsList.add(Divider(
      color: Colors.white,
      thickness: 2,
      height: 1,
      indent: 20,
      endIndent: 20,
    ));

    //add an entry for each deck available
    model.decks.forEach(
        (item) => menuItemsList.add(buildMenuItem(item, context, model)));

    // Settings entry
    menuItemsList.add(ListTile(
      leading: Icon(Icons.settings),
      title: Text(
        'SETTINGS',
        style: TextStyle(
            color: PitechColors.green2,
            fontWeight: FontWeight.w700,
            fontSize: 20),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'settings');
      },
    ));

    return SafeArea(
      child: Drawer(
          child: Container(
            decoration: BoxDecoration(color: PitechColors.green1),
            child: ListView(
              children: menuItemsList,
            ),
      )),
    );
  }

  ListTile buildMenuItem(Deck deck, BuildContext context, DeckViewModel model) {
    Deck currentDeck = model.currentDeck;
    bool isCurrent = currentDeck?.title == deck.title;

    return ListTile(
      title: Text(
        deck.title,
        style: TextStyle(
            color: isCurrent ? PitechColors.white : PitechColors.green2,
            fontWeight: FontWeight.w500,
            fontSize: 20),
      ),
      leading: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 24,
          maxHeight: 24,
        ),
        child: Center(child: Image.asset(deck.icon, fit: BoxFit.cover)),
      ),
      onTap: () {
        model.setCurrentDeck(deck);
        Navigator.pop(context);
      },
    );
  }
}
