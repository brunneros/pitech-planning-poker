import 'package:flutter/material.dart';
import 'package:planningpoker/core/viewmodels/deck_view_model.dart';
import 'package:planningpoker/ui/shared/pitech_colors.dart';

class CardsTable extends StatefulWidget {
  final DeckViewModel model;

  CardsTable(this.model);

  @override
  State<StatefulWidget> createState() => CardsTableState(model);
}

class CardsTableState extends State<CardsTable> {
  DeckViewModel model;

  CardsTableState(this.model);

  @override
  void initState() {
    model.getDecks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: PitechColors.white,
        child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 6.5 / 9,
            padding: const EdgeInsets.all(15.0),
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 15.0,
            children: model.currentDeck.cards
                .map((value) => cardBox(value))
                .toList()));
  }

  Material cardBox(value) {
    return Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
            // When the user taps the button, navigate to a named route
            // and provide the arguments as an optional parameter.
            onTap: () =>
                Navigator.pushNamed(context, "showcard", arguments: value),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: PitechColors.green2,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(value,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: PitechColors.white,
                      fontSize: 50)),
            )));
  }
}
