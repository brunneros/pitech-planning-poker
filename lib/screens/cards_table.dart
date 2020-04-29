import 'package:flutter/material.dart';
import 'package:planningpoker/model/deck.dart';

class CardsTable extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CardsTableState();
}

class CardsTableState extends State<CardsTable> {

  final deck = Deck();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white30,
      child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 6.5/9,
          padding: const EdgeInsets.all(15.0),
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
          children: deck.cards.map((value) => cardBox(value)).toList()
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