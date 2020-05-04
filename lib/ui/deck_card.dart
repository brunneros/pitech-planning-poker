import 'package:flutter/material.dart';

class DeckCard extends StatelessWidget {

  final String cardValue;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: SafeArea(
        child: InkWell(
            onTap: () => Navigator.pop(context),
            child:Container(
              margin: EdgeInsets.all(30.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 57, 170, 169),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(cardValue,
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.white)),
            )
        ),
      )
    );
  }

  const DeckCard({
   Key key,
   @required this.cardValue
  }) : super(key: key);
}