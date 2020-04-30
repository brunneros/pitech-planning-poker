import 'package:flutter/material.dart';
import 'package:planningpoker/core/viewmodels/cards_table_model.dart';
import 'package:planningpoker/core/viewmodels/deck_view_model.dart';
import 'package:planningpoker/locator.dart';

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
    return  Container(
        color: Colors.white30,
        child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 6.5/9,
            padding: const EdgeInsets.all(15.0),
            mainAxisSpacing: 15.0,
            crossAxisSpacing: 15.0,
            children: model.currentDeck.cards.map((value) => cardBox(value)).toList()
        )
    );
  }

  Container cardBox(value) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5)
      ),
      child: Text(value,
      style: Theme.of(context)
          .textTheme
          .display1
          .copyWith(color: Colors.white)),
    );
  }


}