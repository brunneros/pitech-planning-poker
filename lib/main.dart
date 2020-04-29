import 'package:flutter/material.dart';
import 'package:planningpoker/screens/side_menu.dart';
import 'screens/cards_table.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fuel cost calculator',
        home: Scaffold(
          appBar: AppBar(
            title: Text('PitechPlus Planning Poker'),
          ),
          drawer: SideMenu(),
          body: CardsTable(),
        ));
  }
}
