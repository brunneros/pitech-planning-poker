import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SideMenuState();
}

class SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {

    List<Widget> menuItemsList = [];
    var types = [];
    List<Map> menuItems = getMenuItems();

    // Menu header
    menuItemsList.add(
        DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Menu')
        )
    );

    // Add all the items
    menuItems.forEach((item) => menuItemsList.add(buildMenuItem(item, context)));

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

  ListTile buildMenuItem(Map itemData, BuildContext context) {
    return ListTile(
      title: Text(itemData['title']),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  List<Map> getMenuItems() {
    return [
      {'icon': null, 'title': "Fibonacci"},
      {'icon': null, 'title': "T-shirt"},
      {'icon': null, 'title': "Natural"},
    ];
  }
}

